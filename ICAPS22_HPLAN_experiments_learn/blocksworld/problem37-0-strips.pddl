( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b721 - block
    b134 - block
    b101 - block
    b863 - block
    b735 - block
    b300 - block
    b492 - block
    b151 - block
    b902 - block
    b393 - block
    b806 - block
    b474 - block
    b780 - block
    b441 - block
    b965 - block
    b313 - block
    b556 - block
    b130 - block
    b528 - block
    b121 - block
    b635 - block
    b978 - block
    b739 - block
    b242 - block
    b179 - block
    b455 - block
    b32 - block
    b677 - block
    b801 - block
    b327 - block
    b215 - block
    b113 - block
    b506 - block
    b857 - block
    b724 - block
    b27 - block
    b160 - block
    b574 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b721 )
    ( on b134 b721 )
    ( on b101 b134 )
    ( on b863 b101 )
    ( on b735 b863 )
    ( on b300 b735 )
    ( on b492 b300 )
    ( on b151 b492 )
    ( on b902 b151 )
    ( on b393 b902 )
    ( on b806 b393 )
    ( on b474 b806 )
    ( on b780 b474 )
    ( on b441 b780 )
    ( on b965 b441 )
    ( on b313 b965 )
    ( on b556 b313 )
    ( on b130 b556 )
    ( on b528 b130 )
    ( on b121 b528 )
    ( on b635 b121 )
    ( on b978 b635 )
    ( on b739 b978 )
    ( on b242 b739 )
    ( on b179 b242 )
    ( on b455 b179 )
    ( on b32 b455 )
    ( on b677 b32 )
    ( on b801 b677 )
    ( on b327 b801 )
    ( on b215 b327 )
    ( on b113 b215 )
    ( on b506 b113 )
    ( on b857 b506 )
    ( on b724 b857 )
    ( on b27 b724 )
    ( on b160 b27 )
    ( on b574 b160 )
    ( clear b574 )
  )
  ( :goal
    ( and
      ( clear b721 )
    )
  )
)
