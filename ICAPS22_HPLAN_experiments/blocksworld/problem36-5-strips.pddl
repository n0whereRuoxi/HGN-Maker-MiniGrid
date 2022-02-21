( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b814 - block
    b272 - block
    b370 - block
    b714 - block
    b418 - block
    b191 - block
    b118 - block
    b648 - block
    b561 - block
    b846 - block
    b336 - block
    b186 - block
    b938 - block
    b710 - block
    b562 - block
    b646 - block
    b172 - block
    b386 - block
    b776 - block
    b109 - block
    b793 - block
    b262 - block
    b736 - block
    b756 - block
    b62 - block
    b900 - block
    b455 - block
    b933 - block
    b40 - block
    b876 - block
    b237 - block
    b695 - block
    b757 - block
    b643 - block
    b977 - block
    b519 - block
    b381 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b814 )
    ( on b272 b814 )
    ( on b370 b272 )
    ( on b714 b370 )
    ( on b418 b714 )
    ( on b191 b418 )
    ( on b118 b191 )
    ( on b648 b118 )
    ( on b561 b648 )
    ( on b846 b561 )
    ( on b336 b846 )
    ( on b186 b336 )
    ( on b938 b186 )
    ( on b710 b938 )
    ( on b562 b710 )
    ( on b646 b562 )
    ( on b172 b646 )
    ( on b386 b172 )
    ( on b776 b386 )
    ( on b109 b776 )
    ( on b793 b109 )
    ( on b262 b793 )
    ( on b736 b262 )
    ( on b756 b736 )
    ( on b62 b756 )
    ( on b900 b62 )
    ( on b455 b900 )
    ( on b933 b455 )
    ( on b40 b933 )
    ( on b876 b40 )
    ( on b237 b876 )
    ( on b695 b237 )
    ( on b757 b695 )
    ( on b643 b757 )
    ( on b977 b643 )
    ( on b519 b977 )
    ( on b381 b519 )
    ( clear b381 )
  )
  ( :goal
    ( and
      ( clear b814 )
    )
  )
)
