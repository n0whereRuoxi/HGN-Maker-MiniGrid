( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b297 - block
    b532 - block
    b343 - block
    b210 - block
    b848 - block
    b330 - block
    b794 - block
    b801 - block
    b145 - block
    b445 - block
    b942 - block
    b354 - block
    b898 - block
    b547 - block
    b81 - block
    b771 - block
    b875 - block
    b403 - block
    b229 - block
    b750 - block
    b463 - block
    b889 - block
    b499 - block
    b152 - block
    b340 - block
    b270 - block
    b957 - block
    b451 - block
    b896 - block
    b972 - block
    b225 - block
    b830 - block
    b159 - block
    b946 - block
    b667 - block
    b370 - block
    b814 - block
    b737 - block
    b853 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b297 )
    ( on b532 b297 )
    ( on b343 b532 )
    ( on b210 b343 )
    ( on b848 b210 )
    ( on b330 b848 )
    ( on b794 b330 )
    ( on b801 b794 )
    ( on b145 b801 )
    ( on b445 b145 )
    ( on b942 b445 )
    ( on b354 b942 )
    ( on b898 b354 )
    ( on b547 b898 )
    ( on b81 b547 )
    ( on b771 b81 )
    ( on b875 b771 )
    ( on b403 b875 )
    ( on b229 b403 )
    ( on b750 b229 )
    ( on b463 b750 )
    ( on b889 b463 )
    ( on b499 b889 )
    ( on b152 b499 )
    ( on b340 b152 )
    ( on b270 b340 )
    ( on b957 b270 )
    ( on b451 b957 )
    ( on b896 b451 )
    ( on b972 b896 )
    ( on b225 b972 )
    ( on b830 b225 )
    ( on b159 b830 )
    ( on b946 b159 )
    ( on b667 b946 )
    ( on b370 b667 )
    ( on b814 b370 )
    ( on b737 b814 )
    ( on b853 b737 )
    ( clear b853 )
  )
  ( :goal
    ( and
      ( clear b297 )
    )
  )
)
