( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b831 - block
    b914 - block
    b409 - block
    b216 - block
    b176 - block
    b48 - block
    b56 - block
    b631 - block
    b587 - block
    b987 - block
    b473 - block
    b645 - block
    b598 - block
    b970 - block
    b229 - block
    b947 - block
    b210 - block
    b289 - block
    b625 - block
    b817 - block
    b489 - block
    b254 - block
    b572 - block
    b940 - block
    b470 - block
    b353 - block
    b515 - block
    b451 - block
    b335 - block
    b468 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b831 )
    ( on b914 b831 )
    ( on b409 b914 )
    ( on b216 b409 )
    ( on b176 b216 )
    ( on b48 b176 )
    ( on b56 b48 )
    ( on b631 b56 )
    ( on b587 b631 )
    ( on b987 b587 )
    ( on b473 b987 )
    ( on b645 b473 )
    ( on b598 b645 )
    ( on b970 b598 )
    ( on b229 b970 )
    ( on b947 b229 )
    ( on b210 b947 )
    ( on b289 b210 )
    ( on b625 b289 )
    ( on b817 b625 )
    ( on b489 b817 )
    ( on b254 b489 )
    ( on b572 b254 )
    ( on b940 b572 )
    ( on b470 b940 )
    ( on b353 b470 )
    ( on b515 b353 )
    ( on b451 b515 )
    ( on b335 b451 )
    ( on b468 b335 )
    ( clear b468 )
  )
  ( :goal
    ( and
      ( clear b831 )
    )
  )
)
