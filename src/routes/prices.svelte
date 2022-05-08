<script>
    import Hero from "$lib/components/Hero.svelte";
    import GetstartedForm from "$lib/components/GetstartedForm.svelte";

    const heroOptions = {
        type: 'heading',
        height: 'md:h-3/6',
        headerOptions: {
            headerPosition: 'md:mt-[20rem] lg:mt-[20rem] xl:mt-[20rem]',
            title: 'Preise',
        },
        image: {
            url: 'hero_form.jpg',
            alt: 'Picture of the recruiting process'
        }
    }
</script>
<Hero {...heroOptions} />
<div class="overflow-x-auto">
    <div class="pb-8 pt-10 bg-white mt-0">
        <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
            <div class="overflow-x-auto">
              <table class="table w-full">
                <!-- head -->
                <thead>
                  <tr>
                    <th>Thema</th>
                    <th>Beschreibung</th>
                    <th>Preis pro Stunde</th>
                  </tr>
                </thead>
                <tbody>
                  <!-- row 1 -->
                  <tr>
                    <td>Support</td>
                    <td>Verunterstüzung & Telefon Support</td>
                    <td>85.- CHF</td>
                  </tr>
                  <!-- row 2 -->
                  <tr>
                    <td>Netzwek</td>
                    <td>Einrichten und Warten von Netwerken</td>
                    <td>90.- CHF</td>
                  </tr>
                  <!-- row 3 -->
                  <tr>
                    <td>Server Administration</td>
                    <td>Einrichten und Warten von Server</td>
                    <td>125.- CHF</td>
                  </tr>
                </tbody>
              </table>
            </div>
        </div>
    </div>
</div>