{extends file=$display_obj->layout}
{block name=body}{$SCRIPT_CONTENT}

<a href="phpapps_admin_applications_form_imp.php?gact=editRec&gfield=ID&gfield_value=1" class="modalPopup">comment #1</a><br>


    <iframe id="thedialog" style="display:none;" width="390"></iframe>



 
<script>
$(document).ready(function () {
    $(".modalPopup").click(function () {
        $("#thedialog").attr('src', $(this).attr("href"));
        $("#thedialog").dialog({
            width: 400,
            height: 450,
            modal: true,
            close: function () {
                $("#thedialog").attr('src', "about:blank");
            }
        });
        return false;
    });
});
</script>

{/block}