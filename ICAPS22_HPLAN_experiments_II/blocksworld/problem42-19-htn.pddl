( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b509 - block
    b247 - block
    b30 - block
    b195 - block
    b194 - block
    b228 - block
    b722 - block
    b145 - block
    b431 - block
    b977 - block
    b110 - block
    b909 - block
    b123 - block
    b246 - block
    b276 - block
    b927 - block
    b971 - block
    b107 - block
    b115 - block
    b946 - block
    b491 - block
    b723 - block
    b954 - block
    b70 - block
    b446 - block
    b557 - block
    b421 - block
    b449 - block
    b240 - block
    b746 - block
    b85 - block
    b427 - block
    b640 - block
    b921 - block
    b139 - block
    b582 - block
    b287 - block
    b915 - block
    b897 - block
    b127 - block
    b655 - block
    b24 - block
    b83 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b509 )
    ( on b247 b509 )
    ( on b30 b247 )
    ( on b195 b30 )
    ( on b194 b195 )
    ( on b228 b194 )
    ( on b722 b228 )
    ( on b145 b722 )
    ( on b431 b145 )
    ( on b977 b431 )
    ( on b110 b977 )
    ( on b909 b110 )
    ( on b123 b909 )
    ( on b246 b123 )
    ( on b276 b246 )
    ( on b927 b276 )
    ( on b971 b927 )
    ( on b107 b971 )
    ( on b115 b107 )
    ( on b946 b115 )
    ( on b491 b946 )
    ( on b723 b491 )
    ( on b954 b723 )
    ( on b70 b954 )
    ( on b446 b70 )
    ( on b557 b446 )
    ( on b421 b557 )
    ( on b449 b421 )
    ( on b240 b449 )
    ( on b746 b240 )
    ( on b85 b746 )
    ( on b427 b85 )
    ( on b640 b427 )
    ( on b921 b640 )
    ( on b139 b921 )
    ( on b582 b139 )
    ( on b287 b582 )
    ( on b915 b287 )
    ( on b897 b915 )
    ( on b127 b897 )
    ( on b655 b127 )
    ( on b24 b655 )
    ( on b83 b24 )
    ( clear b83 )
  )
  ( :tasks
    ( Make-42Pile b247 b30 b195 b194 b228 b722 b145 b431 b977 b110 b909 b123 b246 b276 b927 b971 b107 b115 b946 b491 b723 b954 b70 b446 b557 b421 b449 b240 b746 b85 b427 b640 b921 b139 b582 b287 b915 b897 b127 b655 b24 b83 )
  )
)
