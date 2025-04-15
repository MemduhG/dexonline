{extends "layout-admin.tpl"}

{block "title"}Sözlük için kısaltmaları düzenle{/block}

{block "content"}
  <h3>Editează abrevieri pentru dicționar</h3>

  {notice type=warning}
    Bir kısaltma düzenlendiğinde, biçimi değiştirildiğinde, o sözlükte daha önce düzenlenmiş diğer tanımlar da etkilenir.
  {/notice}

  <div class="card mb-3">
    <div class="card-header">
      Kaynak seçimi
    </div>
    <div class="card-body">
      <form class="d-flex align-items-center mb-3">
        <label class="me-2">kaynak</label>
        {include "bits/sourceDropDown.tpl" sources=$allSources skipAnySource=true}
        <button type="button" class="btn btn-primary ms-2" id="load">
          göster
        </button>
      </form>

      <h5>Tablo başlığı için açıklamalar</h5>

      <dl class="row">
        <dt class="col-sm-3">Imp. = Zorunlu kısaltma</dt>
        <dd class="col-sm-9">
           Düzenlenmiş biçimi dikkate almaz ve “Kısaltma” alanındaki biçimi zorunlu kılar.
          <div class="text-muted">
            Hatalı OCR veya sözlükte tutarsızlık durumlarında kullanışlıdır
          </div>
        </dd>

        <dt class="col-sm-3">Amb. = Belirsiz kısaltma</dt>
        <dd class="col-sm-9">
          <em>loc., ac., cont.</em> gibi durumlar için
        </dd>

        <dt class="col-sm-3">CS = case sensitive</dt>
        <dd class="col-sm-9">
          Büyük ve küçük harfler arasında ayrım: v. ≠ V.
        </dd>

        <dt class="col-sm-3">HTML</dt>
        <dd class="col-sm-9">
          Değer HTML’ye dönüştürülmelidir.
        </dd>

        <dt class="col-sm-3">Kısaltma</dt>
        <dd class="col-sm-9">
          Sadece <code>.</code> değil, diğer noktalama işaretlerine ve
          <code>$</code>, <code>@</code>, <code>%</code>, <code>_{}</code>, <code>^{}</code> gibi iç biçimlendirmeye de izin verir.
        </dd>

        <dt class="col-sm-3"> Kısaltmanın detaylandırılması</dt>
        <dd class="col-sm-9">
          <code>$</code>, <code>@</code>, <code>%</code>,
          <code>_{}</code>, <code>^{}</code> gibi iç biçimlendirmeye izin verir..
        </dd>
      </dl>

    </div>
  </div>

  {* div populated by ajax calls *}
  <div id="abbrevs"></div>
  {include "bits/abbrevListModal.tpl"}
{/block}
