( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b724 - block
    b858 - block
    b994 - block
    b905 - block
    b975 - block
    b749 - block
    b149 - block
    b692 - block
    b55 - block
    b962 - block
    b846 - block
    b63 - block
    b375 - block
    b461 - block
    b728 - block
    b758 - block
    b887 - block
    b760 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b724 )
    ( on b858 b724 )
    ( on b994 b858 )
    ( on b905 b994 )
    ( on b975 b905 )
    ( on b749 b975 )
    ( on b149 b749 )
    ( on b692 b149 )
    ( on b55 b692 )
    ( on b962 b55 )
    ( on b846 b962 )
    ( on b63 b846 )
    ( on b375 b63 )
    ( on b461 b375 )
    ( on b728 b461 )
    ( on b758 b728 )
    ( on b887 b758 )
    ( on b760 b887 )
    ( clear b760 )
  )
  ( :goal
    ( and
      ( clear b724 )
    )
  )
)
