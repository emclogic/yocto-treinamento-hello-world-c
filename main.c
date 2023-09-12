#include <stdio.h>
#include <curl/curl.h>

size_t write_callback(void *contents, size_t size, size_t nmemb, char *output) {
    size_t total_size = size * nmemb;
    printf("%s", (char *)contents);
    return total_size;
}

// teste
int main() {
    CURL *curl;
    CURLcode res;

    curl_global_init(CURL_GLOBAL_DEFAULT);

    curl = curl_easy_init();
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, "http://worldtimeapi.org/api/timezone/America/Sao_Paulo");
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_callback);

        res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            fprintf(stderr, "curl_easy_perform() failed: %s\n", curl_easy_strerror(res));
        }

        curl_easy_cleanup(curl);
    }

    curl_global_cleanup();

    return 0;
}

