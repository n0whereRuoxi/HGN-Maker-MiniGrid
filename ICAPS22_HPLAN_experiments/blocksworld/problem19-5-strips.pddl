( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b809 - block
    b961 - block
    b253 - block
    b263 - block
    b701 - block
    b588 - block
    b351 - block
    b874 - block
    b522 - block
    b722 - block
    b883 - block
    b587 - block
    b769 - block
    b118 - block
    b796 - block
    b970 - block
    b829 - block
    b146 - block
    b223 - block
    b61 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b809 )
    ( on b961 b809 )
    ( on b253 b961 )
    ( on b263 b253 )
    ( on b701 b263 )
    ( on b588 b701 )
    ( on b351 b588 )
    ( on b874 b351 )
    ( on b522 b874 )
    ( on b722 b522 )
    ( on b883 b722 )
    ( on b587 b883 )
    ( on b769 b587 )
    ( on b118 b769 )
    ( on b796 b118 )
    ( on b970 b796 )
    ( on b829 b970 )
    ( on b146 b829 )
    ( on b223 b146 )
    ( on b61 b223 )
    ( clear b61 )
  )
  ( :goal
    ( and
      ( clear b809 )
    )
  )
)
