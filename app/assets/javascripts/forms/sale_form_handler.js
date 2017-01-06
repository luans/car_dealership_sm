$(document).ready(function() {
  if ($('[data-sale-form-handler]').length <= 0) {
    return false
  }

  (function(jQuery, Vue) {
    var element = '[data-sale-form-handler]';
    var $el = jQuery(element);

    var $vehicle = $el.find('[name=vehicle-informations]');
    var vehicleParams = $vehicle.data('params');
    var vehicleUrl = $vehicle.data('fetcher-url');

    var $seller = $el.find('[name=seller-informations]');
    var sellerParams = $seller.data('params');
    var sellerUrl = $seller.data('fetcher-url');

    var $purchaser = $el.find('[name=purchaser-informations]');
    var purchaserParams = $purchaser.data('params');
    var purchaserUrl = $purchaser.data('fetcher-url');

    new Vue({
      el: element,
      data: {
        vehicle: vehicleParams || {},
        seller: sellerParams || {},
        purchaser: purchaserParams || {},
        isVehicleLoaded: false,
        isSellerLoaded: false,
        isPurchaserLoaded: false
      },
      mounted: function() {
        if (this.vehicle.id) {
          setVehicle(this.vehicle.license_plate, this)
        }

        if (this.seller.id) {
          setSeller(this.seller.cpf, this)
        }

        if (this.purchaser.id) {
          setPurchaser(this.purchaser.cpf, this)
        }
      },
      methods: {
        fetchVehicle: function() {
          setVehicle(this.vehicle.license_plate, this)
        },
        fetchSeller: function() {
          setSeller(this.seller.cpf, this)
        },
        fetchPurchaser: function() {
          setPurchaser(this.purchaser.cpf, this)
        }
      }
    });

    function setVehicle(license_plate, vue) {
      if (/^[a-zA-Z]{3}-[0-9]{4}$/.test(license_plate)) {
        jQuery.getJSON(vehicleUrl, {license_plate: license_plate}, function(response) {
          if (response.length > 0) {
            vue.vehicle = response[0];
            vue.isVehicleLoaded = true;

            $('html, body').animate({
              scrollTop: jQuery('[name=seller-informations]').offset().top - 50
            }, 1000);

            jQuery(vue.$refs.sellerCpf).focus();
          } else {
            vue.isVehicleLoaded = false;
            jQuery(vue.$refs.licensePlate).focus();
          }
        })
      } else {
        if (vue.isVehicleLoaded) {
          vue.vehicle = {};
          vue.isVehicleLoaded = false;
        }
      }
    }

    function setSeller(cpf, vue) {
      if (/^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$/.test(cpf)) {
        $.getJSON(sellerUrl, {cpf: cpf}, function(response) {
          if (response.length > 0) {
            vue.seller = response[0];
            vue.isSellerLoaded = true;

            $('html, body').animate({
              scrollTop: jQuery('[name=purchaser-informations]').offset().top - 50
            }, 1000);

            jQuery(vue.$refs.purchaserCpf).focus();
          } else {
            vue.isSellerLoaded = false;
            jQuery(vue.$refs.sellerCpf).focus();
          }
        })
      } else {
        if (vue.isSellerLoaded) {
          vue.seller = {};
          vue.isSellerLoaded = false;
        }
      }
    }

    function setPurchaser(cpf, vue) {
      if (/^[0-9]{3}.[0-9]{3}.[0-9]{3}-[0-9]{2}$/.test(cpf)) {
        $.getJSON(purchaserUrl, {cpf: cpf}, function(response) {
          if (response.length > 0) {
            vue.purchaser = response[0];
            vue.isPurchaserLoaded = true;

            $('html, body').animate({
              scrollTop: jQuery('[name=sale-informations]').offset().top - 50
            }, 1000);

            jQuery(vue.$refs.salePrice).focus();
          } else {
            vue.isPurchaserLoaded = false;
            jQuery(vue.$refs.purchaserCpf).focus();
          }
        })
      } else {
        if (vue.isPurchaserLoaded) {
          vue.purchaser = {};
          vue.isPurchaserLoaded = false;
        }
      }
    }
  })(jQuery, Vue);
});
