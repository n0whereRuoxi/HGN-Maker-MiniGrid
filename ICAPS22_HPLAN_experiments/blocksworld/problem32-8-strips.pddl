( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b783 - block
    b280 - block
    b194 - block
    b138 - block
    b314 - block
    b891 - block
    b895 - block
    b604 - block
    b892 - block
    b42 - block
    b767 - block
    b149 - block
    b136 - block
    b561 - block
    b982 - block
    b880 - block
    b436 - block
    b586 - block
    b661 - block
    b44 - block
    b706 - block
    b908 - block
    b776 - block
    b479 - block
    b33 - block
    b147 - block
    b48 - block
    b655 - block
    b343 - block
    b590 - block
    b1 - block
    b377 - block
    b628 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b783 )
    ( on b280 b783 )
    ( on b194 b280 )
    ( on b138 b194 )
    ( on b314 b138 )
    ( on b891 b314 )
    ( on b895 b891 )
    ( on b604 b895 )
    ( on b892 b604 )
    ( on b42 b892 )
    ( on b767 b42 )
    ( on b149 b767 )
    ( on b136 b149 )
    ( on b561 b136 )
    ( on b982 b561 )
    ( on b880 b982 )
    ( on b436 b880 )
    ( on b586 b436 )
    ( on b661 b586 )
    ( on b44 b661 )
    ( on b706 b44 )
    ( on b908 b706 )
    ( on b776 b908 )
    ( on b479 b776 )
    ( on b33 b479 )
    ( on b147 b33 )
    ( on b48 b147 )
    ( on b655 b48 )
    ( on b343 b655 )
    ( on b590 b343 )
    ( on b1 b590 )
    ( on b377 b1 )
    ( on b628 b377 )
    ( clear b628 )
  )
  ( :goal
    ( and
      ( clear b783 )
    )
  )
)
