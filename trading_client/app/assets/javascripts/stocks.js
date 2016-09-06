(function () {
    $(function () {
        init_stock_lookup();
    });


    function init_stock_lookup() {
        var $stocksForm = $('#stock-lookup-form'),
            $stockLookup = $('#stock-lookup'),
            $stockLookupResults = $('#stock-lookup-results'),
            $stockLookupErrors = $('#stock-lookup-errors');

        $stocksForm.on('ajax:success', function (event, data, status) {
            $stockLookup.replaceWith(data);
            init_stock_lookup();
        });

        $stocksForm.on('ajax:error', function (event, xhr, status, error) {
            $stockLookupResults.replaceWith('');
            $stockLookupErrors.replaceWith('Błąd: ' + error);
        });
    }

})();