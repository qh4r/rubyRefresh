(function () {
    $(function () {
        init_stock_lookup();
    });


    function init_stock_lookup() {
        var $stocksForm = $('#stock-lookup-form'),
            $stockLookup = $('#stock-lookup'),
            $stockLookupResults = $('#stock-lookup-results'),
            $stockLookupErrors = $('#stock-lookup-errors'),
            $spinner = $('#spinner'); // mozna uzyc metody z app

        $stocksForm.on('ajax:before', function () {
            $spinner.css({display: 'block'});
        });

        $stocksForm.on('ajax:success', function (event, data, status) {
            $spinner.css({display: 'none'});
            $stockLookup.replaceWith(data);
            init_stock_lookup();
        });

        $stocksForm.on('ajax:error', function (event, xhr, status, error) {
            $spinner.css({display: 'none'});
            $stockLookupResults.replaceWith('');
            $stockLookupErrors.replaceWith('Błąd: ' + error);
        });
    }

})();