( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b714 - block
    b195 - block
    b578 - block
    b216 - block
    b64 - block
    b207 - block
    b846 - block
    b812 - block
    b266 - block
    b385 - block
    b457 - block
    b786 - block
    b949 - block
    b403 - block
    b377 - block
    b520 - block
    b502 - block
    b907 - block
    b215 - block
    b21 - block
    b625 - block
    b480 - block
    b379 - block
    b583 - block
    b191 - block
    b473 - block
    b706 - block
    b452 - block
    b938 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b714 )
    ( on b195 b714 )
    ( on b578 b195 )
    ( on b216 b578 )
    ( on b64 b216 )
    ( on b207 b64 )
    ( on b846 b207 )
    ( on b812 b846 )
    ( on b266 b812 )
    ( on b385 b266 )
    ( on b457 b385 )
    ( on b786 b457 )
    ( on b949 b786 )
    ( on b403 b949 )
    ( on b377 b403 )
    ( on b520 b377 )
    ( on b502 b520 )
    ( on b907 b502 )
    ( on b215 b907 )
    ( on b21 b215 )
    ( on b625 b21 )
    ( on b480 b625 )
    ( on b379 b480 )
    ( on b583 b379 )
    ( on b191 b583 )
    ( on b473 b191 )
    ( on b706 b473 )
    ( on b452 b706 )
    ( on b938 b452 )
    ( clear b938 )
  )
  ( :goal
    ( and
      ( clear b714 )
    )
  )
)
