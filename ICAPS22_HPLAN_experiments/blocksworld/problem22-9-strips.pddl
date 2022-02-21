( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b737 - block
    b357 - block
    b566 - block
    b614 - block
    b231 - block
    b680 - block
    b757 - block
    b74 - block
    b856 - block
    b709 - block
    b311 - block
    b530 - block
    b931 - block
    b753 - block
    b181 - block
    b36 - block
    b403 - block
    b927 - block
    b911 - block
    b375 - block
    b979 - block
    b938 - block
    b601 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b737 )
    ( on b357 b737 )
    ( on b566 b357 )
    ( on b614 b566 )
    ( on b231 b614 )
    ( on b680 b231 )
    ( on b757 b680 )
    ( on b74 b757 )
    ( on b856 b74 )
    ( on b709 b856 )
    ( on b311 b709 )
    ( on b530 b311 )
    ( on b931 b530 )
    ( on b753 b931 )
    ( on b181 b753 )
    ( on b36 b181 )
    ( on b403 b36 )
    ( on b927 b403 )
    ( on b911 b927 )
    ( on b375 b911 )
    ( on b979 b375 )
    ( on b938 b979 )
    ( on b601 b938 )
    ( clear b601 )
  )
  ( :goal
    ( and
      ( clear b737 )
    )
  )
)
