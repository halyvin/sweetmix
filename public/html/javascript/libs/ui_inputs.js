function customRadio() {
    $('.pradio').each(function(){
        var el = $(this);
        var active = '';
        if ( el.is(':checked') ) active = ' active';
        var id = el.attr('id');
        var name = el.attr('name');
        var html = '<label for="'+id+'" data-name="'+name+'" class="pradio'+active+'"></label>';
        el.after(html).hide();
    });

    // Handlers
    $('label').bind('click',function(){
        var el = $(this);
        var id = el.attr('for');
        var input = $('#'+id);
        if ( input.hasClass('pradio') ) {
            var name = input.attr('name');
            $('.pradio[data-name='+name+'], .pcheckbox[data-name='+name+']').removeClass('active');
            $('.pradio[for='+id+'], .pcheckbox[for='+id+']').addClass('active');
        }
        return true;
    });
    
}

function customCheckbox() {
    $('.pcheckbox').each(function(){
        var el = $(this)
        var active = ''
        if ( el.is(':checked') ) active = ' active'
        var id = el.attr('id')
        var name = el.attr('name')
        var html = '<label for="'+id+'" data-name="'+name+'" class="pcheckbox'+active+'"></label>'
        el.after(html).hide()
    })

    // Handlers
    $('label').bind('click',function(){
        var el = $(this)
        var id = el.attr('for')
        var input = $('#'+id)
        if ( input.hasClass('pcheckbox') ) {
            var name = input.attr('name')
            $('.pcheckbox[for='+id+']').toggleClass('active')
        }
        return true
    })
}