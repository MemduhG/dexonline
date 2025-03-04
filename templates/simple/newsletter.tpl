{extends "layout.tpl"}

{block "title"}
    {cap}newsletter{/cap}
{/block}

{block "content"}

  <h3>Abonează-te la newsletter</h3>

  <p class="fs-4 ps-3">
  {include "bits/newsletterForm.tpl"}
  <p>
  <br/>
  <h3>{cap}Contact{/cap}</h3>

  <p class="fs-4 ps-3">
    <a href="mailto:newsletter@dexonline.ro">
        {include "bits/icon.tpl" i=email}
        newsletter@dexonline.ro
    </a>
  <p>
  <h3>Arhiva newsletterului</h3>

  <p class="ps-3">
    <span class="fs-5">&#x2022; 3 martie 2025 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzM3LCJmNDliYjg0ZjhlMGIiLDQsIjNlYjljZCIsMjExMSwxXQ">
      jurnal de dicționar / martie 25</a></span> <span class="fs-6">(femeie, babe, familie, frumusețe, franceză, publicitate)</span>
    </br>
    <span class="fs-5">&#x2022; 3 februarie 2025 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzM2LCI4ZDQ0YTI4YzBkODUiLDQsIjNlYjljZCIsMTk1OCwxXQ">
      jurnal de dicționar / februarie 25</a></span> <span class="fs-6">(amor, Dragobete, Sf. Valentin, atlas lingvistic, dopamină, caligrafie, Octavian Mocanu)</span>
    </br>
    <span class="fs-5">&#x2022; 3 ianuarie 2025 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzM1LCJhZTU0MTMzZjE0ODUiLDQsIjNlYjljZCIsMTkzNSwxXQ">
      jurnal de dicționar / ianuarie 25</a></span> <span class="fs-6">(top 2024, empatie, sudalme, cacofonie, lerui ler, onomastică de sezon)</span>
    </br>
    <span class="fs-5">&#x2022; 3 decembrie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzMxLCIyNzg4YmFkMWZkYjkiLDQsIjNlYjljZCIsMTcwNSwxXQ">
      jurnal de dicționar / decembrie 24</a></span> <span class="fs-6">(predictibilitate, pleonasm, perisologie, siglă, logo, acronim, curcan, păcănele)</span>
    </br>
    <span class="fs-5">&#x2022; 3 noiembrie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzMwLCJjZTg4NjE5NzlmMmUiLDQsIjNlYjljZCIsMTQxMCwxXQ">
      jurnal de dicționar / noiembrie 24</a></span> <span class="fs-6">(greșeli prezidențiabili, Halloween, ziua pastelor, Mihail şi Gavriil, prenume nume, cuscus, a lua (la) cunoștință, YouTube dexonline, simpozion Iași)</span>
    </br>
     <span class="fs-5">&#x2022; 3 octombrie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzI5LCI2N2NiYjU4MWEzZGUiLDQsIjNlYjljZCIsMTIxMiwxXQ">
      jurnal de dicționar / octombrie 24</a></span> <span class="fs-6">(profesor, magister dixit, astrologie, Laurențiu Bașchir, OmniOpenCon)</span>
    </br>
    <span class="fs-5">&#x2022; 9 septembrie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzI1LCJkZTNhNDA0ZGE3MTciLDQsIjNlYjljZCIsMTE3NSwxXQ">
      bliț-răvaș / septembrie 24</a></span> <span class="fs-6">(Ziua Limbii Române, concurs, premii)</span>
    </br>
    <span class="fs-5">&#x2022; 3 septembrie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzIzLCJiNmQxYzEwOTVkMDciLDQsIjNlYjljZCIsMTE1NiwxXQ">
      jurnal de dicționar / septembrie 24</a></span> <span class="fs-6">(Ziua Limbii Române, școală, pampers, Radu Borza)</span>
    </br>
   <span class="fs-5">&#x2022; 3 august 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzIwLCIzMGNlMThjNDk0MmEiLDQsIjNlYjljZCIsMTA1MiwxXQ">
      jurnal de dicționar / august 24</a></span> <span class="fs-6">(concurs, Ziua Limbii Române, panseluțe, oameni, BBC, jaluzea, caniculă, cuvinte aleatorii, Anca Alexandru)</span>
    </br>
  <span class="fs-5">&#x2022; 3 iulie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzE2LCI1YjdmZGU3YzNmNjQiLDQsIjNlYjljZCIsODgyLDFd">
      jurnal de dicționar / iulie 24</a></span> <span class="fs-6">(cifre romane, bacalaureat, Dicționar enciclopedic ilustrat CADE,
      greșeli dexonline, interviu playtech, Oana Ciobancan)</span>
  </br>
  <span class="fs-5">&#x2022; 3 iunie 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzEzLCI2ZjQwZjM1ZWNlOTMiLDQsIjNlYjljZCIsNjA0LDFd">
      jurnal de dicționar / iunie 24</a></span> <span class="fs-6">(Mircea Miclea, empatie, principii dexonline, învederat-inveterat, Cătălin Frâncu)</span>
  <br/>
    <span class="fs-5">&#x2022; 3 mai 2024 <a href="https://blog.dexonline.ro/?mailpoet_router&endpoint=view_in_browser&action=view&data=WzQsIjI1MDQ2NGViNDQ0MCIsNCwiM2ViOWNkIiwyLDFd">
        jurnal de dicționar / mai 24</a></span> <span class="fs-6">(Leonardo da Vinci, ortografie, ca și, Matei Gall)</span>
  </p>

{/block}
