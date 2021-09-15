from django.shortcuts import render, redirect
from .models import Coupon
from .forms import AddCouponForm
from  django.views.decorators.http import require_POST
from  django.utils import timezone

@require_POST

def add_coupon(request):
    now = timezone.now()
    form = AddCouponForm(request.POST)
    if form.is_valid():
        code = form.cleaned_data['code']
        try:
            coupon = Coupon.objects.get(code__iexact=code, use_from__lte=now, use_to__gte=now, active=True)
            request.session['coupon_id'] = coupon.id
        except Coupon.DoseNotExit:
            request.session['coupon_id'] = None
        return redirect('cart:detail')