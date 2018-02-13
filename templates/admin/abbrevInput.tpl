{extends "layout-admin.tpl"}

{block "title"}Adaugă abrevieri pentru dicționar{/block}


{block "content"}
  <h3>Adaugă abrevieri pentru dicționar</h3>

  {if $message}
    <div class="alert alert-{$msgClass} alert-dismissible">
      <button type="button" class="close" data-dismiss="alert">
        <span aria-hidden="true">&times;</span>
      </button>
      {$message}
    </div>
  {/if}
  <div class="panel panel-default">
    <div class="panel-heading">
      {if $csv|count == 0} 
        Selectare fișier 
      {else} 
        Alegere sursă 
      {/if}
    </div>
    <div class="panel-body">
      <form class="form-horizontal" method="post" enctype="multipart/form-data">
        {if $csv|count > 0}
          <div class="form-group">
            <label class="col-sm-1 control-label">sursa</label>
            <div class="col-sm-11">
              {include "bits/sourceDropDown.tpl" sources=$allModeratorSources skipAnySource=true}
            </div>
          </div>
        {/if}

        {if $csv|count == 0}
          <div class="form-group">
            <label class="col-sm-1 control-label">fișier</label>
            <div class="col-sm-6">
              <input class="form-control" type="file" name="file">
            </div>
            <label class="col-sm-2 control-label">delimitator</label>
            <div class="col-sm-2">
              <input class="form-control"
                     type="text"
                     name="delimiter"
                     placeholder="implicit |">
            </div>
            <span class="col-sm-offset-1 col-sm-8 text-danger">
              Important! Asigurați-vă că fișierul este codificat ASCII sau UTF-8.
            </span>

          </div>
        
        <p class="text-muted">
          Fișierul sursă trebuie să aibă pe primul rând capul de tabel <b>enforced|ambiguous|caseSensitive|short|long</b>, iar pe celelate rânduri 5(cinci) câmpuri delimitate, conform explicațiilor: </br>
          <b>1.</b> abreviere impusă - nu ia în considerare forma editată - <i>valoare booleană 0/1</i></br>
          <b>2.</b> abreviere ambiguă - <i>valoare booleană 0/1</i></br>
          <b>3.</b> diferențiere între majuscule și minuscule- <i>valoare booleană 0/1</i></br>
          <b>4.</b> abrevierea</br>
          <b>5.</b> detalierea abrevierii - <i>permite formatare internă html $,@,%</i></br></br>
        </p>
        {/if}
    </div>
  </div>
  {if $csv|count == 0}
    <div class="form-group">
      <div class="col-sm-10">
        <button class="btn btn-primary" type="submit" name="submit">
          încarcă
        </button>
      </div>
    </div>
  {/if}


  {if $csv|count  != 0}
    <div class="panel-admin">
      <div class="panel panel-default">
        <div class="panel-heading" id="panel-heading">
          <i class="glyphicon glyphicon-user"></i>
          {$modUser}
        </div>

        <table id="abrrevs" class="table table-striped ">
          <thead>
            <tr>
              <th>Nr.</th>
              <th>Imp.</th>
              <th>Amb.</th>
              <th>CS</th>
              <th>Abreviere</th>
              <th>Detalierea abrevierii</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$csv key=k item=v}
              <tr>
                <td><span class="sourceShortName">{$k+1}</span></td>
                <td><span class="enforced">{$v.enforced}</span></td>
                <td><span class="ambiguous">{$v.ambiguous}</span></td>
                <td><span class="caseSensitive">{$v.caseSensitive}</td>
                <td><span class="short">{$v.short}</span></td>
                <td><span class="long">{$v.long}</span></td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>
    </div>

    <div class="form-group">
      <div class="col-sm-10">

        <button class="btn btn-success" name="saveButton">
          <i class="glyphicon glyphicon-floppy-disk"></i>
          <u>s</u>alvează 
        </button>
        <button class="btn btn-primary" name="cancelButton">
          <i class="glyphicon glyphicon-remove"></i>
          abandonează
        </button>

      </div>
    </div>
  {/if}
</form> 

{/block}
