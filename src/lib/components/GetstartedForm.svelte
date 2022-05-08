<script>
    import { toast } from '../../stores.js'
    
    let submit;
    let formData = {
        first_name: '',
        last_name: '',
        email: '',
        organization: '',
        phone: '',
        topic: 'Wie kann ich Ihnen helfen?',
    }

    function handleSubmit() {
      // Send a POST request to src/routes/contact.js endpoint
      $toast.active = true;
      $toast.message = 'Sende...';
      $toast.type = 'info';
      submit = fetch('/api/send/mail', {
        method: 'POST',
        body: JSON.stringify({...formData}),
        headers: { 'content-type': 'application/json' },
      })
        .then((resp) => {
            if (resp.status === 200) {
                $toast.active = true;
                $toast.message = 'Ihre Anfrage wurde versandt';
                $toast.type = 'success';
                Object.keys(formData).forEach(function (item) {
                    formData[item] = ''
                });
                formData.topic='Wie kann ich Ihnen helfen?';
            } else {
                $toast.active = true;
                $toast.message = 'There was an error';
                $toast.type = 'error';
            }
            resp.json()
        })
        .finally(() => setTimeout(() => {
            $toast.active = false;
            (submit = null)
        }, 5000))
    }
</script>
<!-- This example requires Tailwind CSS v2.0+ -->
<div class="pb-8 pt-10 bg-white mt-0">
  <div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8">
    <form form on:submit|preventDefault={handleSubmit} method="post">
      <div class="grid xl:grid-cols-2 xl:gap-6">
        <div class="relative z-0 mb-6 w-full group">
            <input type="text" name="first_name" id="first_name" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required bind:value={formData.first_name} />
            <label for="first_name" class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 z-1 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Vorname:*</label>
        </div>
        <div class="relative z-0 mb-6 w-full group">
            <input type="text" name="last_name" id="last_name" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " required bind:value={formData.last_name}/>
            <label for="last_name" class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 z-1 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Nachname*:</label>
        </div>
      </div>
      <div class="grid xl:grid-cols-2 xl:gap-6">
         <div class="relative z-0 mb-6 w-full group">
          <input
            type="email" 
            name="email" 
            id="email" 
            class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" 
            placeholder=" "
            required 
            bind:value={formData.email}/>
          <label for="email" class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 z-1 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">E-Mail Addresse*:</label>
        </div>
         <div class="relative z-0 mb-6 w-full group">
            <input
                type="text" 
                name="organization" 
                id="organization" 
                class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" 
                placeholder=" " 
                bind:value={formData.organization} 
                />
            <label for="organization" class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 z-1 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Firma:</label>
        </div>
      </div>
      <div class="grid xl:grid-cols-2 xl:gap-6">
        <div class="relative z-0 mb-6 w-full group">
            <input type="text" name="phone" id="phone" class="block py-2.5 px-0 w-full text-sm text-gray-900 bg-transparent border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600 dark:focus:border-blue-500 focus:outline-none focus:ring-0 focus:border-blue-600 peer" placeholder=" " bind:value={formData.phone}/>
            <label for="phone" class="absolute text-sm text-gray-500 dark:text-gray-400 duration-300 transform -translate-y-6 scale-75 top-3 z-1 origin-[0] peer-focus:left-0 peer-focus:text-blue-600 peer-focus:dark:text-blue-500 peer-placeholder-shown:scale-100 peer-placeholder-shown:translate-y-0 peer-focus:scale-75 peer-focus:-translate-y-6">Telefone:</label>
        </div>
       <div class="relative z-0 mb-6 w-full group">
            <select name="topic" id="topic" class="block select w-full text-sm text-gray-500 dark:text-gray-400 border-0 border-b-2 border-gray-300 appearance-none dark:text-white dark:border-gray-600" required bind:value={formData.topic}>
              <option disabled selected>Wie kann ich Ihnen helfen?</option>
                <option>Support</option>
                <option>Netwerk</option>
                <option>Webauftritt</option>
            </select>
        </div>
      </div>

      <button
        type="submit" 
        class="ripple-bg-cust-turqoise ml-8 whitespace-nowrap inline-flex items-center justify-center px-4 py-2 border border-transparent rounded-md shadow-sm text-base font-medium text-white bg-cust-indigo hover:bg-indigo-700"
        >
        Submit
    </button>
    </form>
  </div>
</div>

<style lang="scss">
    #topic {
        border-radius: 0px;
        padding-left: 0px;
        font-weight: 400;
        position: relative;
        bottom: 5px;
        &:focus {
            outline: none;
        }
    }
</style>