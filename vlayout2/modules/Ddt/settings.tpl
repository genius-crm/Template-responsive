<script type="text/javascript" src="libraries/bootstrap/js/bootstrap-tab.js"></script>
<style>

</style>
<div class="main_content">
<ul id="tabs" class="nav nav-tabs nav-justified" data-tabs="tabs" style="margin: 20px;">
    <li class="active"><a data-toggle="tab" href="#cfg">{vtranslate('SETTINGS', $MODULENAME)}</a></li>
    <li><a data-toggle="tab" href="#uninstall">{vtranslate('DELETE', $MODULENAME)}</a></li>
        {* Removal of this link violates the principles of License
        Usunięcie tego linku narusza zasady licencji *}
    <li><a href="#help" data-toggle="tab">{vtranslate('LBL_HELP_SETTINGS', $MODULENAME)}</a></li>
</ul>
<div id="my-tab-content" class="tab-content" style="margin: 0 30px;" >
	<div class=" tab-pane active" id="cfg">
		<div class="alert alert-block alert-info fade in">
			<button type="button" class="close" data-dismiss="alert">×</button>
			<h3 class="alert-heading"><i class="icon-info-sign"></i>  {vtranslate('Alert_title', $MODULENAME)}</h3>
			<p>{vtranslate('Alert_desc', $MODULENAME)}</p>
		</div>	
		{foreach item=item key=key from=$CONFIG}
			<div class="row-fluid">
				<div class="span6">
					<h5>{vtranslate($key, $MODULENAME)}</h5>
				</div>
				<div class="span6">
					<input id="{$key}" name="{$key}" type="checkbox" value="1" {if $item eq 1} checked {/if}/>
				</div>
			</div>
		{/foreach}
    </div>
    {* delete module form *}
    <div class=" tab-pane" id="uninstall">
        <form class="form-horizontal recordEditView" id="EditView" name="EditView" method="post" action="index.php?module=OSSMail&view=Uninstall&parent=Settings&block={$smarty.get.block}&fieldid={$smarty.get.fieldid}">
            <input type="hidden" name="uninstall" value="uninstall" />
            <input type="hidden" name="status" value="1" />
            <p> </p>            
            <table class="table table-bordered blockContainer showInlineTable">
                <tr>
                    <th class="blockHeader" colspan="4">{vtranslate('Delete_panel', $MODULENAME)}{$MODULENAME}</th>
                </tr>
                <tr>
                    <td class="fieldLabel" colspan="4">
                        <span class="pull-right">
                            <button class="btn btn-danger btn-large" name="uninstall" type="submit"  data-toggle="modal" data-target="#myModal"><strong>{vtranslate('Uninstall', $MODULENAME)}</strong></button>
                            <a class="cancelLink" type="reset" onclick="javascript:window.history.back();">{vtranslate('Cancel', $MODULENAME)}</a> 
                        </span>
                    </td>
                </tr>            
            </table>            
        </form>
    </div>
        {* help *}
    <div class=' tab-pane' id="help">
        <form class="form-horizontal recordEditView" id="EditView" name="EditView" method="post" action="index.php?module={$MODULENAME}&view=Configuration&parent=Settings">
            <input type="hidden" name="mode" value="ticket" />            
            <p> </p>            
            <table class="table table-bordered blockContainer showInlineTable">
                <tr>
                    <th class="blockHeader" colspan="4">{vtranslate('LBL_HELP_SETTINGS', $MODULENAME)}</th>
                </tr>
                <tr>
                    <td colspan="4">{vtranslate('HelpDescription', $MODULENAME)}</td>
                </tr>
                <tr>
                    <td class="fieldLabel">
                        <label class="muted pull-right marginRight10px"> {vtranslate('LBL_TroubleUrl', $MODULENAME)}</label>
                    </td>
                    <td class="fieldValue" >
                        <div class="row-fluid"><span class="span10">
                                <a href="{vtranslate('LBL_UrlLink', $MODULENAME)}" target="_blank">{vtranslate('LBL_UrlLink', $MODULENAME)}</a> ({vtranslate('LBL_UrlLinkInfo', $MODULENAME)})</span>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="fieldLabel">
                        <label class="muted pull-right marginRight10px"> {vtranslate('LBL_OurWebsite', $MODULENAME)}</label>
                    </td>
                    <td class="fieldValue" >
                        <div class="row-fluid"><span class="span10">
                                {*
                                // Removal of this link violates the principles of License
                                // Usunięcie tego linku narusza zasady licencji *}
                                <a href="{vtranslate('LBL_OurWebsiteLink', $MODULENAME)}" target="_blank">{vtranslate('LBL_OurWebsiteLink', $MODULENAME)}</a></span>
                        </div>
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>

{* modal promtp for uninstall *}
<div id="myModal" class="modal hide fade">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
        <h3>{vtranslate('MSG_DEL_WARN1', $MODULENAME)}</h3>
    </div>
    <div class="modal-body">
        <p>{vtranslate('MSG_DEL_WARN2', $MODULENAME)}</p>
        <p><input id="status" name="status" type="checkbox" value="1" required="required" /> {vtranslate('Uninstall OSSMailScanner module', $MODULENAME)}</p>
    </div>
    <div class="modal-footer">
        <a href="#" class="btn" data-dismiss="modal">{vtranslate('No', $MODULENAME)}</a>
        <a href="#" class="btn btn-danger okay-button" id="confirm" type="submit" name="uninstall" form="EditView" disabled="disabled">{vtranslate('Yes', $MODULENAME)}</a>
    </div>          
</div>
</div>
{literal}
<script>
	function saveConfig(param, value) {
		var params = {
			'module': 'Ddt',
			'action': "SaveConfig",
			'param': param,
			'value': value
		}
		AppConnector.request(params).then(
			function(data) {
				var response = data['result'];
				if (response['success']) {
					var params = {
						text: response['data'],
						type: 'info',
						animation: 'show'
					};
					Vtiger_Helper_Js.showPnotify(params);
				} else {
					var params = {
						text: response['data'],
						animation: 'show'
					};
					Vtiger_Helper_Js.showPnotify(params);
				}
			},
			function(data, err) {

			}
		);
	}
</script>
{/literal}
<script>
{foreach item=row key=key from=$CONFIG}
	jQuery('#{$key}').on('change', function() {
		saveConfig('{$key}',jQuery(this).attr('checked'));
	});
{/foreach}
</script>
