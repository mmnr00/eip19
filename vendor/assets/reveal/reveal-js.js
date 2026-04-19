/**
 * Template Name: Reveal - Rails Turbolinks Safe Version
 * Refactored for Rails + Turbolinks + jQuery
 */

(function ($) {
  "use strict";

  // ==================================================
  // MAIN PAGE LOAD
  // ==================================================
  $(document).on('turbolinks:load', function () {
    console.log("JS FILE LOADED");

    initBackToTop();
    initStickyHeader();
    initIntroCarousel();
    initWOW();
    initSuperfish();
    initMobileNavigation();
    initSmoothScroll();
    initHashScroll();
    initNavigationActiveState();
    initTestimonialsCarousel();
    initClientsCarousel();
    initVenobox();
    initPortfolio();
    initPortfolioDetailsCarousel();
  });

  // ==================================================
  // CLEANUP BEFORE TURBOLINKS CACHE
  // ==================================================
  $(document).on('turbolinks:before-cache', function () {
    $('#mobile-nav, #mobile-nav-toggle, #mobile-body-overly').remove();
    $('body').removeClass('mobile-nav-active');
  });

  // ==================================================
  // BACK TO TOP
  // ==================================================
  function initBackToTop() {
    $(window).off('scroll.backtotop').on('scroll.backtotop', function () {
      if ($(this).scrollTop() > 100) {
        $('.back-to-top').fadeIn('slow');
      } else {
        $('.back-to-top').fadeOut('slow');
      }
    });

    $(document).off('click.backtotop', '.back-to-top')
      .on('click.backtotop', '.back-to-top', function (e) {
        e.preventDefault();
        $('html, body').animate({ scrollTop: 0 }, 1500, 'easeInOutExpo');
      });
  }

  // ==================================================
  // STICKY HEADER
  // ==================================================
  function initStickyHeader() {
    if ($('#header').length && !$('#header').hasClass('is-sticky')) {
      $('#header').sticky({
        topSpacing: 0,
        zIndex: '50'
      }).addClass('is-sticky');
    }
  }

  // ==================================================
  // INTRO CAROUSEL
  // ==================================================
  function initIntroCarousel() {
    if ($("#intro-carousel").length && !$("#intro-carousel").hasClass('owl-loaded')) {
      $("#intro-carousel").owlCarousel({
        autoplay: true,
        dots: false,
        loop: true,
        animateOut: 'fadeOut',
        items: 5
      });
    }
  }

  // ==================================================
  // WOW
  // ==================================================
  function initWOW() {
    if (typeof WOW === "function") {
      new WOW().init();
    }
  }

  // ==================================================
  // SUPERFISH MENU
  // ==================================================
  function initSuperfish() {
    if ($('.nav-menu').length) {
      $('.nav-menu').superfish({
        animation: { opacity: 'show' },
        speed: 400
      });
    }
  }

  // ==================================================
  // MOBILE NAVIGATION
  // ==================================================
  function initMobileNavigation() {
    $('#mobile-nav, #mobile-nav-toggle, #mobile-body-overly').remove();
    $('body').removeClass('mobile-nav-active');

    if ($('#nav-menu-container').length) {
      var $mobile_nav = $('#nav-menu-container').clone().prop({
        id: 'mobile-nav'
      });

      $mobile_nav.find('> ul').attr({
        class: '',
        id: ''
      });

      $('body').append($mobile_nav);
      $('body').prepend(
        '<button type="button" id="mobile-nav-toggle"><i class="fa fa-bars"></i></button>'
      );
      $('body').append('<div id="mobile-body-overly"></div>');

      $('#mobile-nav .menu-has-children').prepend(
        '<i class="fa fa-chevron-down"></i>'
      );
    }
  }

  // mobile submenu
  $(document)
    .off('click.mobilesubmenu', '.menu-has-children i')
    .on('click.mobilesubmenu', '.menu-has-children i', function () {
      $(this).next().toggleClass('menu-item-active');
      $(this).nextAll('ul').eq(0).slideToggle();
      $(this).toggleClass('fa-chevron-up fa-chevron-down');
    });

  // mobile toggle button
  $(document)
    .off('click.mobiletoggle', '#mobile-nav-toggle')
    .on('click.mobiletoggle', '#mobile-nav-toggle', function () {
      $('body').toggleClass('mobile-nav-active');
      $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
      $('#mobile-body-overly').toggle();
    });

  // click outside close
  $(document)
    .off('click.mobileoutside')
    .on('click.mobileoutside', function (e) {
      var container = $("#mobile-nav, #mobile-nav-toggle");

      if (
        !container.is(e.target) &&
        container.has(e.target).length === 0 &&
        $('body').hasClass('mobile-nav-active')
      ) {
        $('body').removeClass('mobile-nav-active');
        $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
        $('#mobile-body-overly').fadeOut();
      }
    });

  // ==================================================
  // SMOOTH SCROLL
  // ==================================================
  function initSmoothScroll() {
    $(document)
      .off('click.scrollnav', '.nav-menu a, #mobile-nav a, .scrollto')
      .on('click.scrollnav', '.nav-menu a, #mobile-nav a, .scrollto', function (e) {

        if (
          location.pathname.replace(/^\//, '') === this.pathname.replace(/^\//, '') &&
          location.hostname === this.hostname
        ) {
          var target = $(this.hash);

          if (target.length) {
            e.preventDefault();

            var scrolltoOffset = $('#header').outerHeight() - 1;
            var scrollto = target.offset().top - scrolltoOffset;

            $('html, body').animate({
              scrollTop: scrollto
            }, 1500, 'easeInOutExpo');

            $('.nav-menu .menu-active').removeClass('menu-active');
            $(this).closest('li').addClass('menu-active');

            if ($('body').hasClass('mobile-nav-active')) {
              $('body').removeClass('mobile-nav-active');
              $('#mobile-nav-toggle i').toggleClass('fa-times fa-bars');
              $('#mobile-body-overly').fadeOut();
            }
          }
        }
      });
  }

  // ==================================================
  // HASH SCROLL
  // ==================================================
  function initHashScroll() {
    if (window.location.hash) {
      var target = $(window.location.hash);

      if (target.length) {
        var scrolltoOffset = $('#header').outerHeight() - 1;
        $('html, body').animate({
          scrollTop: target.offset().top - scrolltoOffset
        }, 1500, 'easeInOutExpo');
      }
    }
  }

  // ==================================================
  // ACTIVE NAV ON SCROLL
  // ==================================================
  function initNavigationActiveState() {
    $(window).off('scroll.navactive').on('scroll.navactive', function () {
      var cur_pos = $(this).scrollTop() + 200;
      var nav_sections = $('section');
      var main_nav = $('.nav-menu, #mobile-nav');

      nav_sections.each(function () {
        var top = $(this).offset().top;
        var bottom = top + $(this).outerHeight();

        if (cur_pos >= top && cur_pos <= bottom) {
          main_nav.find('li').removeClass('menu-active');
          main_nav.find('a[href="#' + $(this).attr('id') + '"]')
            .parent('li')
            .addClass('menu-active');
        }
      });
    });
  }

  // ==================================================
  // TESTIMONIALS
  // ==================================================
  function initTestimonialsCarousel() {
    if ($('.testimonials-carousel').length &&
        !$('.testimonials-carousel').hasClass('owl-loaded')) {

      $(".testimonials-carousel").owlCarousel({
        autoplay: true,
        dots: true,
        loop: true,
        responsive: {
          0: { items: 1 },
          768: { items: 2 },
          900: { items: 3 }
        }
      });
    }
  }

  // ==================================================
  // CLIENTS
  // ==================================================
  function initClientsCarousel() {
    if ($('.clients-carousel').length &&
        !$('.clients-carousel').hasClass('owl-loaded')) {

      $(".clients-carousel").owlCarousel({
        autoplay: true,
        dots: true,
        loop: true,
        responsive: {
          0: { items: 2 },
          768: { items: 4 },
          900: { items: 6 }
        }
      });
    }
  }

  // ==================================================
  // VENOBOX
  // ==================================================
  function initVenobox() {
    if ($('.venobox').length) {
      $('.venobox').venobox();
    }
  }

  // ==================================================
  // PORTFOLIO
  // ==================================================
  function initPortfolio() {
    if ($('.portfolio-container').length) {
      var portfolioIsotope = $('.portfolio-container').isotope({
        itemSelector: '.portfolio-item',
        layoutMode: 'fitRows'
      });

      $(document)
        .off('click.portfolio', '#portfolio-flters li')
        .on('click.portfolio', '#portfolio-flters li', function () {
          $('#portfolio-flters li').removeClass('filter-active');
          $(this).addClass('filter-active');

          portfolioIsotope.isotope({
            filter: $(this).data('filter')
          });
        });
    }
  }

  // ==================================================
  // PORTFOLIO DETAILS
  // ==================================================
  function initPortfolioDetailsCarousel() {
    if ($('.portfolio-details-carousel').length &&
        !$('.portfolio-details-carousel').hasClass('owl-loaded')) {

      $(".portfolio-details-carousel").owlCarousel({
        autoplay: true,
        dots: true,
        loop: true,
        items: 1
      });
    }
  }

})(jQuery);