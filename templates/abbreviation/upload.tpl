{extends "layout-admin.tpl"}

{block "title"} Sözlüğe kısaltma ekle{/block}


{block "content"}
  <h3>Sözlüğe kısaltma ekle</h3>

  <form method="post" enctype="multipart/form-data">

    {* No abbreviations loaded yet -- show file selector and legend *}
    {if empty($abbrevs)}
      <div class="card mb-3">

        <div class="card-header">
          Dosya seçimi
        </div>

        <div class="card-body pb-0">

          <div class="row mb-3">
            <label class="col-md-1 col-form-label">dosya</label>
            <div class="col-md-6">
              <input class="form-control" type="file" name="file">
            </div>
            <label class="col-md-2 col-form-label">ayraç</label>
            <div class="col-md-2">
              <input class="form-control"
                type="text"
                name="delimiter"
                placeholder="implicit |">
            </div>
            <span class="offset-md-1 col-md-8 text-danger">
               Önemli! Dosyanın ASCII veya UTF-8 formatında kodlandığından emin olun.
            </span>
          </div>

          <p>
            Kaynak dosyanın ilk satırında tablo başlığı bulunmalıdır
            <strong>enforced|ambiguous|caseSensitive|html|short|internalRep</strong>,
            ve diğer satırlarda açıklamalara uygun olarak beş ayrılmış alan olmalıdır:
          </p>

          <dl class="row">
            <dt class="col-xl-3"> zorunlu kısaltma</dt>
            <dd class="col-xl-9">
              düzenlenmiş biçimi dikkate almaz ve “short” alanındaki biçimi zorunlu kılar - 0/1 mantıksal değeri
            </dd>

            <dt class="col-xl-3">belirsiz kısaltma</dt>
            <dd class="col-xl-9">
               0/1 mantıksal değeri
            </dd>

            <dt class="col-xl-3">büyük/küçük harf ayrımı</dt>
            <dd class="col-xl-9">
               0/1 mantıksal değeri
            </dd>

            <dt class="col-xl-3">HTML içerir</dt>
            <dd class="col-xl-9">
               0/1 mantıksal değeri - değerin HTML’ye dönüştürülmesi gerekip gerekmediğini belirtir
            </dd>

            <dt class="col-xl-3">kısaltma</dt>
            <dd class="col-xl-9">
              Sadece <code>.</code> değil, diğer noktalama işaretlerine ve
              <code>$</code>, <code>@</code>, <code>%</code>, <code>_{}</code>, <code>^{}</code>
              gibi iç biçimlendirmeye de izin verir
            </dd>

            <dt class="col-xl-3"> kısaltmanın detaylandırılması</dt>
            <dd class="col-xl-9">
              <code>$</code>, <code>@</code>, <code>%</code>,
              <code>_{}</code>, <code>^{}</code> gibi iç biçimlendirmeye izin verir
            </dd>
          </dl>
        </div>
      </div>

      <div>
        <button class="btn btn-primary" type="submit" name="submit">
          önizle
        </button>
      </div>
    {/if}

    {* Abbreviations loaded -- show source dropdown and preview *}
    {if !empty($abbrevs)}
      <div class="card mb-3">

        <div class="card-header">
           Kaynak seçimi
        </div>

        <div class="card-body">
          <div class="row">
            <label class="col-lg-1 form-label">kaynak</label>
            <div class="col-lg-11">
              {include "bits/sourceDropDown.tpl" skipAnySource=true}
            </div>
          </div>
        </div>

      </div>

      <div class="card mb-3">
        <div class="card-header">
          {include "bits/icon.tpl" i=person}
          {$modUser}
        </div>

        <table class="table mb-0">
          <thead>
            <tr>
              <th>Nr.</th>
              <th>Imp.</th>
              <th>Amb.</th>
              <th>CS</th>
              <th>HTML</th>
              <th>Kısaltma</th>
              <th>Kısaltmanın detaylandırılması</th>
            </tr>
          </thead>
          <tbody>
            {foreach from=$abbrevs key=k item=a}
              <tr>
                <td><span class="badge bg-secondary">{$k+1}</span></td>
                <td>
                  {if $a->enforced}
                    {include "bits/icon.tpl" i=done}
                  {/if}
                </td>
                <td>
                  {if $a->ambiguous}
                    {include "bits/icon.tpl" i=done}
                  {/if}
                </td>
                <td>
                  {if $a->caseSensitive}
                    {include "bits/icon.tpl" i=done}
                  {/if}
                </td>
                <td>
                  {if $a->html}
                    {include "bits/icon.tpl" i=done}
                  {/if}
                </td>
                <td>{$a->short}</td>
                <td>{HtmlConverter::convert($a)}</td>
              </tr>
            {/foreach}
          </tbody>
        </table>
      </div>

      <div>
        <button type="submit" class="btn btn-primary" name="saveButton">
          {include "bits/icon.tpl" i=save}
          <u>k</u>aydet
        </button>
        <button type="submit" class="btn btn-link" name="cancelButton">
          {include "bits/icon.tpl" i=clear}
          vazgeç
        </button>
      </div>
    {/if}
  </form>

{/block}
