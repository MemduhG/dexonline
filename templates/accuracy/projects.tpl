{extends "layout-admin.tpl"}

{block "title"}Doğruluk denetimi{/block}

{block "content"}
  <h3>Doğruluk denetimi</h3>

  <div class="card mb-3">
    <div class="card-header">Projelerim</div>

    <div class="card-body">
      {include "bs/checkbox.tpl"
        name=''
        label='diğer moderatörlerin herkese açık projelerini dahil et'
        checked=$includePublic
        inputId='includePublic'}
    </div>

    <table id="projectTable" class="table tablesorter ts-pager mb-0">

      <thead>
        <tr>
          <th>isim</th>
          <th>proje sahibi</th>
          <th>düzenleyen</th>
          <th>kaynak</th>
          <th>tanımlar</th>
          <th>hata/KB</th>
          <th>karakter/saat</th>
        </tr>
      </thead>

      <tbody>
        {foreach $projects as $proj}
          <tr>
            <td><a href="{Router::link('accuracy/eval')}?projectId={$proj->id}">{$proj->name}</a></td>
            <td>{$proj->getOwner()}</td>
            <td>{$proj->getUser()}</td>
            <td>{$proj->getSource()->shortName|default:'&mdash;'}</td>
            <td data-text="{$proj->defCount}">{$proj->defCount|nf}</td>
            <td data-text="{$proj->getErrorsPerKb()}">{$proj->getErrorsPerKb()|nf:2}</td>
            <td data-text="{$proj->getCharactersPerHour()}">{$proj->getCharactersPerHour()|nf}</td>
          </tr>
        {/foreach}
      </tbody>

      {include "bits/pager.tpl" id="projectPager" colspan="7"}
    </table>
  </div>

  <div class="card mb-3">
    <div class="card-header">Yeni bir proje oluştur</div>
    <div class="card-body">

      <form method="post">

        <div class="row mb-2">
          <label for="f_name" class="col-lg-3 col-form-label">nume</label>
          <div class="col-lg-9">
            <input type="text" id="f_name" class="form-control" name="name" value="{$p->name}">
          </div>
        </div>

        <div class="row mb-2">
          <label class="col-lg-3 col-form-label">kullanıcı</label>
          <div class="col-lg-9">
            <select name="userId" class="form-select select2Users">
              <option value="{$p->userId}" selected></option>
            </select>
          </div>
        </div>

        <div class="row mb-2">
          <label for="f_length" class="col-lg-3 col-form-label">uzunluk</label>
          <div class="col-lg-9">
            <input type="number"
              id="f_length"
              class="form-control"
              name="length"
              value="{$length}">
            <div class="form-text">
              değerlendirmek istediğiniz tanımların toplam uzunluğu
            </div>
          </div>
        </div>

        <div class="row mb-2">
          <label for="sourceDropDown" class="col-lg-3 col-form-label">kaynak (isteğe bağlı)</label>
          <div class="col-lg-9">
            {include "bits/sourceDropDown.tpl" name="sourceId" sourceId=$p->sourceId}
          </div>
        </div>

        <div class="row mb-2">
          <label for="f_prefix" class="col-lg-3 col-form-label">ön ek (isteğe bağlı)</label>
          <div class="col-lg-9">
            <input type="text"
              id="f_prefix"
              class="form-control"
              name="lexiconPrefix"
              value="{$p->lexiconPrefix}">
            <div class="form-text">
              yalnızca bu ön ekle başlayan tanımları seç
            </div>
          </div>
        </div>

        <div class="row mb-2">
          <label for="f_startDate" class="col-lg-3 col-form-label">başlangıç tarihi (isteğe bağlı)</label>
          <div class="col-lg-9">
            <input
              type="text"
              id="f_startDate"
              name="startDate"
              value="{$p->startDate}"
              class="form-control"
              placeholder="AAAA-LL-ZZ">
          </div>
        </div>

        <div class="row mb-2">
          <label for="f_endDate" class="col-lg-3 col-form-label">bitiş tarihi (isteğe bağlı)</label>
          <div class="col-lg-9">
            <input
              type="text"
              id="f_endDate"
              name="endDate"
              value="{$p->endDate}"
              placeholder="AAAA-LL-ZZ"
              class="form-control">
          </div>
        </div>

        <div class="row mb-2">
          <label class="col-lg-3 col-form-label">görünürlük</label>
          <div class="col-lg-9">
            {include "bits/dropdown.tpl"
              name="visibility"
              data=AccuracyProject::VIS_NAMES
              selected=$p->visibility}
          </div>
        </div>

        <div class="row mb-2">
          <div class="offset-lg-3 col-lg-9">
            <button class="btn btn-primary" type="submit" name="submitButton">
              oluştur
            </button>
          </div>
        </div>

      </form>
    </div>
  </div>
{/block}
