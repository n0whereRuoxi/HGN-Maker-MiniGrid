( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b282 - block
    b498 - block
    b216 - block
    b532 - block
    b235 - block
    b225 - block
    b238 - block
    b885 - block
    b513 - block
    b114 - block
    b158 - block
    b737 - block
    b164 - block
    b505 - block
    b258 - block
    b600 - block
    b292 - block
    b229 - block
    b5 - block
    b999 - block
    b471 - block
    b331 - block
    b66 - block
    b987 - block
    b697 - block
    b17 - block
    b809 - block
    b295 - block
    b313 - block
    b608 - block
    b384 - block
    b191 - block
    b325 - block
    b70 - block
    b948 - block
    b80 - block
    b286 - block
    b509 - block
    b393 - block
    b450 - block
    b851 - block
    b687 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b282 )
    ( on b498 b282 )
    ( on b216 b498 )
    ( on b532 b216 )
    ( on b235 b532 )
    ( on b225 b235 )
    ( on b238 b225 )
    ( on b885 b238 )
    ( on b513 b885 )
    ( on b114 b513 )
    ( on b158 b114 )
    ( on b737 b158 )
    ( on b164 b737 )
    ( on b505 b164 )
    ( on b258 b505 )
    ( on b600 b258 )
    ( on b292 b600 )
    ( on b229 b292 )
    ( on b5 b229 )
    ( on b999 b5 )
    ( on b471 b999 )
    ( on b331 b471 )
    ( on b66 b331 )
    ( on b987 b66 )
    ( on b697 b987 )
    ( on b17 b697 )
    ( on b809 b17 )
    ( on b295 b809 )
    ( on b313 b295 )
    ( on b608 b313 )
    ( on b384 b608 )
    ( on b191 b384 )
    ( on b325 b191 )
    ( on b70 b325 )
    ( on b948 b70 )
    ( on b80 b948 )
    ( on b286 b80 )
    ( on b509 b286 )
    ( on b393 b509 )
    ( on b450 b393 )
    ( on b851 b450 )
    ( on b687 b851 )
    ( clear b687 )
  )
  ( :goal
    ( and
      ( clear b282 )
    )
  )
)
