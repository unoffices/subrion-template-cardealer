<div class="ia-card ia-item--{$listing.status} {if 'hidden' == $listing.status}-hidden{/if} {if $listing.featured}-featured{/if} {if $listing.sponsored}-sponsored{/if}">
    {if $listing.featured}
        <div class="ia-card__badge ia-card__badge--featured" title="{lang key='featured'}"><span class="fa fa-star"></span> {lang key='featured'}</div>
    {/if}
    {if $listing.sponsored}
        <div class="ia-card__badge ia-card__badge--sponsored" title="{lang key='sponsored'}"><span class="fa fa-usd"></span> {lang key='sponsored'}</div>
    {/if}

    {if $member && $member.id == $listing.member_id && 'active' != $listing.status}
        <span class="label label-status label-{$listing.status}" title="{lang key=$listing.status default=$listing.status}"><span class="fa fa-warning"></span> {lang key=$listing.status default=$listing.status}</span>
    {/if}

    {if $listing.pictures}
        <a class="ia-card__image" href="{$listing.link}">
            {ia_image type='thumbnail' file=$listing.pictures[0] title=$listing.model}
            <span class="ia-card__support-info">
                <span class="pull-left"><span class="fa fa-image"></span> {$listing.pictures_num}</span>
                <span class="hidden-xs pull-right">{$listing.date_added|date_format:$core.config.date_format}</span>
            </span>
        </a>

        {if $listing.sponsored}
            <div class="ia-card__image__more hidden-xs">
                {foreach $listing.pictures as $pic}
                    {if !$pic@first}
                        <a href="{$listing.link}">
                            {ia_image type='thumbnail' file=$pic title=$listing.model}
                        </a>
                    {/if}
                    {if $pic@iteration == 4}
                        {break}
                    {/if}
                {/foreach}
            </div>
        {/if}
    {/if}

    <div class="ia-card__content">
        <div class="ia-card__actions dropdown">
            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><span class="fa fa-ellipsis-h"></span></a>
            <ul class="dropdown-menu pull-right no-drop">
                <li>{printFavorites item=$listing itemtype='autos' guests=true}</li>
                <li><a href="{$listing.link}"><span class="fa fa-automobile"></span> {lang key='car_details'}</a></li>
                <li>{accountActions item=$listing itemtype='autos'}</li>
            </ul>
        </div>

        <a class="ia-card__title" href="{$listing.link}">{$listing.model|escape}, {$listing.release_year}</a>
        <p class="ia-card__sub-title">{$listing.price_formatted}</p>
        <div class="ia-car-info">
            <a class="ia-car-info__icon ia-car-info__icon--body" href="{$smarty.const.IA_URL}search/cars/body:{$listing.body_type}/">{lang key="field_auto_body_type+{$listing.body_type}"}</a>
            {if $listing.engine}
                <a class="ia-car-info__icon ia-car-info__icon--engine" href="{$listing.link}">{lang key="field_auto_engine+{$listing.engine}"}{if $listing.engine_type} {lang key="field_auto_engine_type+{$listing.engine_type}"}{/if}{if $listing.engine_size} {$listing.engine_size}{/if}</a>
            {/if}
            {if $listing.transmission}
                <a class="ia-car-info__icon ia-car-info__icon--transmission" href="{$listing.link}">{lang key="field_auto_transmission+{$listing.transmission}"}</a>
            {/if}
            {if $listing.mileage}
                <a class="ia-car-info__icon ia-car-info__icon--mileage" href="{$listing.link}">{$listing.mileage}</a>
            {/if}
        </div>

        {if $listing.additional_info}
            <p class="ia-car-summary">{$listing.additional_info|strip_tags|truncate:350:'...':true}</p>
        {/if}

        <p class="ia-card__text">
            <a href="{$smarty.const.IA_URL}search/cars/body:{$listing.body_type}/">{lang key="field_auto_body_type+{$listing.body_type}"}</a>,
            {if $listing.engine}
                {lang key="field_auto_engine+{$listing.engine}"}{if $listing.engine_type} {lang key="field_auto_engine_type+{$listing.engine_type}"}{/if}{if $listing.engine_size} {$listing.engine_size}{/if},
            {/if}
            {if $listing.transmission}
                {lang key="field_auto_transmission+{$listing.transmission}"},
            {/if}
            {lang key="field_auto_exterior_color+{$listing.exterior_color}"}
        </p>
    </div>
</div>