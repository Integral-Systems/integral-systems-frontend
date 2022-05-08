<script>
	export let type;
    export let image;
    export let height = 'md:h-4/6';
    export let headerOptions;
    let pbr = 0.55;
</script>

<!-- This example requires Tailwind CSS v2.0+ -->
<div class="relative overflow-hidden {height}">
  <div class="w-screen hidden md:block h-full absolute bg-neutral-900/40 z-10"></div>
  <div class="w-screen">
    <div class="relative z-10">
      <main class="pb-10 mt-10 mx-auto max-w-7xl px-4 sm:mt-15 sm:px-6 lg:px-8 {headerOptions.headerPosition}">
        <div class="text-center">
          <h1 class="text-4xl tracking-tight font-extrabold text-cust-teal sm:text-5xl md:text-6xl">
            {#if type == "landing"}
                <span class="block xl:inline">Ihr Partner</span>
                <span class="block text-cust-turqoise xl:inline">für IT Fragen</span>
            {:else}
            <span class="block xl:inline">{headerOptions.title}</span>
            {/if}
          </h1>
          {#if type == "landing"}
          <p class="mt-3 text-base text-cust-turqoise sm:mt-5 sm:text-lg sm:max-w-xl sm:mx-auto md:mt-5 md:text-xl lg:mx-auto text-center">
            Ich unterstütze Sie auf bei Fragen rund um IT, sei es Netzwerk, Mail, Webauftritt oder Server betrieb.
          </p>
          {/if}
          {#if type == "landing"}
          <div class="mt-5 sm:mt-8 sm:flex sm:justify-center lg:justify-center">
            <div class="rounded-md shadow">
              <a href="/getstarted" class="w-full flex justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-white bg-cust-indigo hover:bg-indigo-700 md:py-4 md:text-lg md:px-10 items-center">
                Loslegen
              </a>
            </div>
            <div class="mt-3 sm:mt-0 sm:ml-3">
              <a href="/prices" class="w-full flex items-center justify-center px-8 py-3 border border-transparent text-base font-medium rounded-md text-indigo-700 bg-indigo-100 hover:bg-indigo-200 md:py-4 md:text-lg md:px-10">
                Preise
              </a>
            </div>
          </div>
          {/if}
        </div>
      </main>
    </div>
  </div>
  <div class="md:absolute md:inset-y-0 md:right-0 md:w-screen hidden md:block">
    <video autoplay muted loop bind:playbackRate={pbr} poster="hero.jpg" class="bg-blue-dark">
      <source src="hero.mp4" type="video/mp4">
      <track kind="captions">
      Your browser does not support the video tag.
    </video>
    <img class="h-56 w-full object-cover sm:h-72 md:h-96 md:w-full md:h-full" src="{image.url}" alt="{image.alt}">
  </div>
</div>

<style lang="scss">
    video {
        height: 100vh;
        width: 100%;
        object-fit: cover; // use "cover" to avoid distortion
        position: absolute;
    }
</style>