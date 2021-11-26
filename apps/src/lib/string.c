#include "string.h"
#include "common.h"
size_t strlen(const char *s) {
    // pcall(strlen);
    int res = 0;
    while (s[res])
    {
        res++;
    }
    return res;
}

char *strcpy(char* dst,const char* src) {
    // pcall(strcpy);
    char* ptr = dst;
    while (*src)
    {
        *dst = *src;
        dst++;
        src++;
    }
    // assert(*src == '\0');
    *dst = *src;
    return ptr;
}

char* strncpy(char* dst, const char* src, size_t n) {
    // pcall(strncpy);
    char* pre = dst;
    int flag = 0;
    while (n--)
    {
        if (!flag && *src == '\0')
        {
            flag = 1;
        }
        if (!flag)
        {
            *dst = *src;
        }
        else
        {
            *dst = '\0';
        }
        dst++;
        src++;
    }
    return pre;
}

size_t strnlen(const char *s, size_t maxlen)
{
    // pcall(strnlen);
    size_t cnt = 0;
    while (s[cnt] && cnt < maxlen)
    {
        cnt++;
    }
    return cnt;
}

char* strcat(char* dst, const char* src) {
    // pcall(strcat);
    // Impl
    char* p = dst;
    while (*p) p++;
    while (*src)
    {
        *p = *src;
        p++;
        src++;
    }
    *p = *src; // End [null]
    return dst;
}

int strcmp(const char* s1, const char* s2) {
    // pcall(strcmp);
    while ((*s1 == *s2) && (*s1 != '\0') && (*s2 != '\0'))
    {
        s1++;
        s2++;
    }
    if (*s1 < *s2)
    {
        return -1; // Note: This value might not be -1
    }
    if (*s1 > *s2)
    {
        return 1;
    }
    return 0;
}

void* memset(void* v,int c,size_t n) {
    // pcall(memset);
    for (int i = 0; i < n; i++)
    {
        *(((uint8_t*) v) + i) = (uint8_t) (c&0xff);
    }
    return v;

}

void* memcpy(void* out, const void* in, size_t n) {
    // pcall(memcpy);
    uint8_t *dest = (uint8_t*) out;
    uint8_t *src  = (uint8_t*) in ;
    while (n--)
    {
        *dest = *src;
        dest++;
        src++;
    }
    return out;
}

int memcmp(const void* s1, const void* s2, size_t n){
    // pcall(memcmp);
    uint8_t *p1 = (uint8_t*) s1, *p2 = (uint8_t*) s2;
    while (n--)
    {
        if (*p1 != *p2)
        {
            if (*p1 > *p2)
            {
                return 1; // not necessiry 1
            }
            if (*p1 < *p2)
            {
                return -1;
            }
            // assert(0);
            // should not reach here
        }
        p1++;
        p2++;
    }
    return 0;
}

