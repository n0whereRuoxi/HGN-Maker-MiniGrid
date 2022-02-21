( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b253 - block
    b904 - block
    b531 - block
    b349 - block
    b68 - block
    b10 - block
    b522 - block
    b340 - block
    b147 - block
    b264 - block
    b543 - block
    b82 - block
    b110 - block
    b960 - block
    b385 - block
    b796 - block
    b816 - block
    b867 - block
    b263 - block
    b368 - block
    b588 - block
    b747 - block
    b364 - block
    b331 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b253 )
    ( on b904 b253 )
    ( on b531 b904 )
    ( on b349 b531 )
    ( on b68 b349 )
    ( on b10 b68 )
    ( on b522 b10 )
    ( on b340 b522 )
    ( on b147 b340 )
    ( on b264 b147 )
    ( on b543 b264 )
    ( on b82 b543 )
    ( on b110 b82 )
    ( on b960 b110 )
    ( on b385 b960 )
    ( on b796 b385 )
    ( on b816 b796 )
    ( on b867 b816 )
    ( on b263 b867 )
    ( on b368 b263 )
    ( on b588 b368 )
    ( on b747 b588 )
    ( on b364 b747 )
    ( on b331 b364 )
    ( clear b331 )
  )
  ( :goal
    ( and
      ( clear b253 )
    )
  )
)
