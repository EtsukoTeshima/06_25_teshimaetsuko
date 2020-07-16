
$(function () {

    // 配列のみの場合
    $('#autocomplete').autocomplete({
        source: foodList1,
        autoFocus: true,
        delay: 300,
        // position: bottom
    });
    $('#autocomplete1').autocomplete({
        source: foodList1,
        autoFocus: true,
        delay: 300,
        // position: bottom
    });
    $('#autocomplete2').autocomplete({
        source: foodList1,
        autoFocus: true,
        delay: 300,
        // position: bottom
    });

    // // 連想配列の場合
    // $("#autocomplete").autocomplete({
    //     source: function (req, resp) {
    //         resp($.map(foodList, function (value, key) {
    //             if (value.foodName.indexOf(req.term) >= 0) {
    //                 return {
    //                     label: value.foodName,
    //                     value: value.foodName,
    //                     data: value,
    //                 };
    //             }
    //         }));
    //     },
    //     autoFocus: true

    //     // 参考URLhttp://arikalog.hateblo.jp/entry/2015/12/25/012829
    // });



    $(".g").change(function () {
        let food_name = $("#autocomplete").val();
        let g = $(".g").val() / 100;
        $(".foodName").val(food_name);
        $(".enerc_kcal").val(foodList2[food_name].enerc_kcal * g);
        $(".protein").val(foodList2[food_name].protein * g);
        $(".lipid").val(foodList2[food_name].lipid * g);
        $(".carbohydrate").val(foodList2[food_name].carbohydrate * g);
        $(".fibtg").val(foodList2[food_name].fibtg * g);
        $(".ca").val(foodList2[food_name].ca * g);
        $(".fe").val(foodList2[food_name].fe * g);
        $(".vita_rae").val(foodList2[food_name].vita_rae * g);
        $(".vitd").val(foodList2[food_name].vitd * g);
        $(".vitk").val(foodList2[food_name].vitk * g);
        $(".thiahcl").val(foodList2[food_name].thiahcl * g);
        $(".ribf").val(foodList2[food_name].ribf * g);
        $(".vitc").val(foodList2[food_name].vitc * g);
        $(".nacl_eq").val(foodList2[food_name].nacl_eq * g);
        console.log(foodList2[food_name].enerc_kcal * g);
    });
    for (let i = 1; i <= 10; i++) {
        $(".g" + i).change(function () {
            let food_name = $("#autocomplete").val();
            console.log(i);
            let g = $(".g1").val() / 100;
            $(".foodName1").val(food_name);
            $(".enerc_kcal1").val(foodList2[food_name].enerc_kcal * g);
            $(".protein1").val(foodList2[food_name].protein * g);
            $(".lipid1").val(foodList2[food_name].lipid * g);
            $(".carbohydrate1").val(foodList2[food_name].carbohydrate * g);
            $(".fibtg1").val(foodList2[food_name].fibtg * g);
            $(".ca1").val(foodList2[food_name].ca * g);
            $(".fe1").val(foodList2[food_name].fe * g);
            $(".vita_rae1").val(foodList2[food_name].vita_rae * g);
            $(".vitd1").val(foodList2[food_name].vitd * g);
            $(".vitk1").val(foodList2[food_name].vitk * g);
            $(".thiahcl1").val(foodList2[food_name].thiahcl * g);
            $(".ribf1").val(foodList2[food_name].ribf * g);
            $(".vitc1").val(foodList2[food_name].vitc * g);
            $(".nacl_eq1").val(foodList2[food_name].nacl_eq * g);
            console.log(foodList2[food_name].enerc_kcal * g);
        });
    };
});



