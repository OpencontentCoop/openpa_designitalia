{def $image = false()
     $aspect_ratio = false()}
{if $node|has_attribute('image')}
	{if $node|attribute('image').content[$image_class]}
	  {set $image = $node|attribute('image').content[$image_class].url}
	  {set $aspect_ratio = $node|attribute('image').content[$image_class].height|div($node|attribute('image').content[$image_class].width)|mul(100)}
	{/if}
{/if}
{if $image}
  <div class="carousel-image"
       style="background-image:url({$image|ezroot(no, full)}); background-repeat: no-repeat; background-size: cover; background-position: center; width: 100%; padding-bottom: {$aspect_ratio}%;min-height: 300px">
  </div>
{/if}
{undef $image}
