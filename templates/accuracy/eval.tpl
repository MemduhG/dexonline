{extends "layout-admin.tpl"}

{block "title"}{$project->name} | doğruluk denetimi{/block}

{block "content"}
  <h3>Doğruluk denetimi projesi - {$project->name}</h3>

  {if $def}
    <div class="card mb-3">
      <div class="card-header">
        Geçerli tanım
        {if !$mine}
          ({$errors} hata)
        {/if}

        <a class="btn btn-outline-secondary btn-sm float-end"
          href="{Router::link('definition/edit')}/{$def->id}">
          {include "bits/icon.tpl" i=edit}
          düzenle
        </a>
      </div>

      <div class="card-body">

        {if $mine}
          <form class="mb-3 row row-cols-lg-auto gx-1"" method="post">
            <input type="hidden" name="defId" value="{$def->id}">
            <input type="hidden" name="projectId" value="{$project->id}">

            <div class="col-12">
              <button id="butDown" type="button" class="btn btn-outline-secondary">
                {include "bits/icon.tpl" i=remove}
              </button>
            </div>

            <div class="col-12">
              <input class="form-control"
                id="errors"
                type="number"
                name="errors"
                value="{$errors}"
                min="0"
                max="999">
            </div>

            <div class="col-12">
              <button id="butUp" type="button" class="btn btn-outline-secondary">
                {include "bits/icon.tpl" i=add}
              </button>
            </div>

            <div class="col-12">
              <button class="btn btn-primary ms-2" type="submit" name="saveButton">
                {include "bits/icon.tpl" i=save}
                <u>k</u>aydet ve sonrakini al
              </button>
            </div>

          </form>
        {/if}

        <p class="currentDef">
          {$def->internalRep}
        </p>

        <p class="currentDef">
          {HtmlConverter::convert($def)}
        </p>

        <div>
          ilişkili girdiler:
          {include "bits/adminEntryList.tpl" entries=$def->getEntries()}
        </div>

        {if count($homonyms)}
          eşanlamlı girdiler:
          {include "bits/adminEntryList.tpl" entries=$homonyms}
        {/if}

      </div>
    </div>
  {elseif $mine}
    <div class="card mb-3">
      <div class="card-header">Definiția curentă</div>
      <div class="card-body">
        Değerlendirilmemiş başka tanım yok. Aşağıdaki tanımlardan birini yeniden inceleyebilirsiniz.
      </div>
    </div>
  {/if}

  <div class="card mb-3">
    <div class="card-header">Doğruluk raporu</div>
    <div class="card-body row">
      <dl class="row col-md-6">
        <dt class="col-md-3">toplam</dt>
        <dd class="col-md-9">
          {$project->defCount|nf} tanım,
          {$project->totalLength|nf} karakter
        </dd>
        <dt class="col-md-3">örneklem</dt>
        <dd class="col-md-9">
          {$project->getSampleDefinitions()|nf} tanım,
          {$project->getSampleLength()|nf} karakter
        </dd>
        <dt class="col-md-3">değerlendirilen</dt>
        <dd class="col-md-9">
          {$project->getReviewedDefinitions()|nf} tanım,
          {$project->getReviewedLength()|nf} karakter
        </dd>
      </dl>

      <dl class="row col-md-6">
        <dt class="col-md-3">hatalar</dt>
        <dd class="col-md-9">{$project->getErrorCount()}</dd>
        <dt class="col-md-3">doğruluk</dt>
        <dd class="col-md-9">
          {$project->getAccuracy()|nf:3}%
          ({$project->getErrorsPerKb()|nf:2} hata / 1.000 karakter)
        </dd>
        <dt class="col-md-3">hız</dt>
        <dd class="col-md-9">
          {if $project->speed}
            {$project->getCharactersPerHour()|nf} karakter / saat
          {else}
            bilinmiyor
          {/if}
        </dd>
      </dl>
    </div>
  </div>

  <div class="card mb-3">
    <div
      class="card-header collapsed"
      data-bs-toggle="collapse"
      href="#editPanel">
      {include "bits/icon.tpl" i=expand_less class="chevron"}
      {if $mine}
        Projeyi düzenle
      {else}
        Proje detayları
      {/if}
    </div>

    <div id="editPanel" class="card-body collapse">

      <form method="post">

        <div class="row mb-2">
          <label class="col-sm-2 form-label">isim</label>
          <div class="col-sm-10">
            <input type="text"
              class="form-control"
              name="name"
              value="{$project->name}"
              {if !$mine}disabled{/if}>
          </div>
        </div>

        <div class="row mb-2">
          <label class="col-sm-2 form-label">görünürlük</label>
          <div class="col-sm-10">
            {include "bits/dropdown.tpl"
              name="visibility"
              data=AccuracyProject::VIS_NAMES
              selected=$project->visibility
              disabled=!$mine}
          </div>
        </div>

        <div class="row mb-2">
          <label class="col-sm-2 form-label">kullanıcı</label>
          <label class="col-sm-10 form-label">
            {$project->getUser()->nick}
          </label>
        </div>

        {if $project->sourceId}
          <div class="row mb-2">
            <label class="col-sm-2 form-label">kaynak</label>
            <label class="col-sm-10 form-label">
              {$project->getSource()->shortName}
            </label>
          </div>
        {/if}

        {if $project->hasStartDate()}
          <div class="row mb-2">
            <label class="col-sm-2 form-label">başlangıç tarihi</label>
            <label class="col-sm-10 form-label">
              {$project->startDate}
            </label>
          </div>
        {/if}

        {if $project->hasEndDate()}
          <div class="row mb-2">
            <label class="col-sm-2 form-label">bitiş tarihi</label>
            <label class="col-sm-10 form-label">
              {$project->endDate}
            </label>
          </div>
        {/if}

        {if $project->lexiconPrefix}
          <div class="row mb-2">
            <label class="col-sm-2 form-label">ön ek</label>
            <label class="col-sm-10 form-label">
              {$project->lexiconPrefix}
            </label>
          </div>
        {/if}

        {if $mine}
          <div class="row mb-2">
            <div class="col-sm-10 offset-sm-2">
              <button class="btn btn-primary" type="submit" name="editProjectButton">
                güncelle
              </button>
            </div>
          </div>
        {/if}
      </form>
    </div>
  </div>

  <div class="card mb-3">
    <div class="card-header">Değerlendirilmiş tanımlar</div>
    <div class="card-body">
      <p>En son değerlendirilen tanımlar önce görünür. Yeniden değerlendirmek için tıklayabilirsiniz.</p>

      {foreach $definitionData as $rec name=definitionLoop}
        <a href="?projectId={$project->id}&defId={$rec.id}">
          {$rec.lexicon}
        </a>
        {if $rec.errors}
          ({$rec.errors})
        {/if}
        {if !$smarty.foreach.definitionLoop.last} | {/if}
      {/foreach}
    </div>
  </div>

  <form method="post">
    <input type="hidden" name="projectId" value="{$project->id}">

    <a class="btn btn-link" href="{Router::link('accuracy/projects')}">
      {include "bits/icon.tpl" i=arrow_back}
      proje listesine geri dön
    </a>

    <button class="btn btn-danger" type="submit" id="deleteButton" name="deleteButton">
      {include "bits/icon.tpl" i=delete}
      sil
    </button>
  </form>
{/block}
