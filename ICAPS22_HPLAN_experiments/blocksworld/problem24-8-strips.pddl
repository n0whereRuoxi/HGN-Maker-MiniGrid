( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b250 - block
    b97 - block
    b916 - block
    b404 - block
    b748 - block
    b52 - block
    b839 - block
    b55 - block
    b165 - block
    b905 - block
    b376 - block
    b807 - block
    b217 - block
    b891 - block
    b498 - block
    b509 - block
    b303 - block
    b326 - block
    b417 - block
    b95 - block
    b454 - block
    b714 - block
    b457 - block
    b317 - block
    b179 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b250 )
    ( on b97 b250 )
    ( on b916 b97 )
    ( on b404 b916 )
    ( on b748 b404 )
    ( on b52 b748 )
    ( on b839 b52 )
    ( on b55 b839 )
    ( on b165 b55 )
    ( on b905 b165 )
    ( on b376 b905 )
    ( on b807 b376 )
    ( on b217 b807 )
    ( on b891 b217 )
    ( on b498 b891 )
    ( on b509 b498 )
    ( on b303 b509 )
    ( on b326 b303 )
    ( on b417 b326 )
    ( on b95 b417 )
    ( on b454 b95 )
    ( on b714 b454 )
    ( on b457 b714 )
    ( on b317 b457 )
    ( on b179 b317 )
    ( clear b179 )
  )
  ( :goal
    ( and
      ( clear b250 )
    )
  )
)
