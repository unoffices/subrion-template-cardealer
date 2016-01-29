{if isset($car_blocks_data.make)}
	<div class="b-makes">
		<div class="container">
			<div class="row">
				<div class="col-md-4">
					<h2>Our featured makes</h2>
					<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Explicabo accusantium recusandae veniam earum dolorum non aperiam eaque.</p>
				</div>
				<div class="col-md-8">
					<div class="owl-carousel pr-list js-carousel-makes">
						{foreach $car_blocks_data.make as $make}
							{if $make.priority}
								<div class="ia-carousel__item">
									<a href="{ia_url type='url' item='autos_models' data=$make}" class="pr-list__item">
										<img src="{$core.page.nonProtocolUrl}uploads/{$make.icon.path}" alt="{$make.title|escape:'html'}">
										<span class="pr-list__item__title">{$make.title|escape:'html'}</span>
										<span class="pr-list__item__num">{$make.num|default:0}</span>
									</a>
								</div>
							{/if}
						{/foreach}
					</div>
				</div>
			</div>
		</div>
	</div>

	{ia_add_js}
$(function() {
	var owlOptions = {
		items: 4,
		margin: 0,
		dots: false,
		nav: true,
		loop: true,
		autoplay:true,
		autoplayTimeout:2500,
		autoplayHoverPause:true,
		navText: ['<span class="fa fa-angle-left"></span>','<span class="fa fa-angle-right"></span>'],
		responsive: {
			0: {
				items: 1
			},
			320: {
				items: 2
			},
			500: {
				items: 3
			},
			768: {
				items: 4
			}
		}
	}

	$('.js-carousel-makes').owlCarousel(owlOptions);
});
	{/ia_add_js}
{/if}