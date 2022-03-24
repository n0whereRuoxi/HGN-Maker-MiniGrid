( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b536 - block
    b899 - block
    b843 - block
    b353 - block
    b869 - block
    b364 - block
    b400 - block
    b761 - block
    b914 - block
    b412 - block
    b9 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b536 )
    ( on b899 b536 )
    ( on b843 b899 )
    ( on b353 b843 )
    ( on b869 b353 )
    ( on b364 b869 )
    ( on b400 b364 )
    ( on b761 b400 )
    ( on b914 b761 )
    ( on b412 b914 )
    ( on b9 b412 )
    ( clear b9 )
  )
  ( :tasks
    ( Make-10Pile b899 b843 b353 b869 b364 b400 b761 b914 b412 b9 )
  )
)
