( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b157 - block
    b357 - block
    b838 - block
    b369 - block
    b406 - block
    b497 - block
    b921 - block
    b151 - block
    b179 - block
    b66 - block
    b814 - block
    b192 - block
    b63 - block
    b878 - block
    b364 - block
    b739 - block
    b856 - block
    b559 - block
    b386 - block
    b851 - block
    b183 - block
    b488 - block
    b975 - block
    b243 - block
    b833 - block
    b147 - block
    b320 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b157 )
    ( on b357 b157 )
    ( on b838 b357 )
    ( on b369 b838 )
    ( on b406 b369 )
    ( on b497 b406 )
    ( on b921 b497 )
    ( on b151 b921 )
    ( on b179 b151 )
    ( on b66 b179 )
    ( on b814 b66 )
    ( on b192 b814 )
    ( on b63 b192 )
    ( on b878 b63 )
    ( on b364 b878 )
    ( on b739 b364 )
    ( on b856 b739 )
    ( on b559 b856 )
    ( on b386 b559 )
    ( on b851 b386 )
    ( on b183 b851 )
    ( on b488 b183 )
    ( on b975 b488 )
    ( on b243 b975 )
    ( on b833 b243 )
    ( on b147 b833 )
    ( on b320 b147 )
    ( clear b320 )
  )
  ( :tasks
    ( Make-26Pile b357 b838 b369 b406 b497 b921 b151 b179 b66 b814 b192 b63 b878 b364 b739 b856 b559 b386 b851 b183 b488 b975 b243 b833 b147 b320 )
  )
)
