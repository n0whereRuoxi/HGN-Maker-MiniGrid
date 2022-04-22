( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b512 - block
    b9 - block
    b222 - block
    b452 - block
    b33 - block
    b814 - block
    b667 - block
    b635 - block
    b12 - block
    b720 - block
    b399 - block
    b270 - block
    b505 - block
    b205 - block
    b290 - block
    b889 - block
    b53 - block
    b101 - block
    b471 - block
    b97 - block
    b278 - block
    b651 - block
    b119 - block
    b336 - block
    b310 - block
    b834 - block
    b867 - block
    b147 - block
    b709 - block
    b557 - block
    b621 - block
    b580 - block
    b742 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b512 )
    ( on b9 b512 )
    ( on b222 b9 )
    ( on b452 b222 )
    ( on b33 b452 )
    ( on b814 b33 )
    ( on b667 b814 )
    ( on b635 b667 )
    ( on b12 b635 )
    ( on b720 b12 )
    ( on b399 b720 )
    ( on b270 b399 )
    ( on b505 b270 )
    ( on b205 b505 )
    ( on b290 b205 )
    ( on b889 b290 )
    ( on b53 b889 )
    ( on b101 b53 )
    ( on b471 b101 )
    ( on b97 b471 )
    ( on b278 b97 )
    ( on b651 b278 )
    ( on b119 b651 )
    ( on b336 b119 )
    ( on b310 b336 )
    ( on b834 b310 )
    ( on b867 b834 )
    ( on b147 b867 )
    ( on b709 b147 )
    ( on b557 b709 )
    ( on b621 b557 )
    ( on b580 b621 )
    ( on b742 b580 )
    ( clear b742 )
  )
  ( :goal
    ( and
      ( clear b512 )
    )
  )
)
