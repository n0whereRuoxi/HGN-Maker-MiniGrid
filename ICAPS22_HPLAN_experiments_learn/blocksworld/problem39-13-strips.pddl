( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b479 - block
    b75 - block
    b38 - block
    b193 - block
    b610 - block
    b788 - block
    b630 - block
    b685 - block
    b855 - block
    b537 - block
    b692 - block
    b496 - block
    b812 - block
    b619 - block
    b925 - block
    b180 - block
    b969 - block
    b59 - block
    b95 - block
    b517 - block
    b412 - block
    b36 - block
    b325 - block
    b887 - block
    b435 - block
    b303 - block
    b480 - block
    b907 - block
    b64 - block
    b965 - block
    b690 - block
    b809 - block
    b665 - block
    b829 - block
    b19 - block
    b901 - block
    b797 - block
    b66 - block
    b795 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b479 b871 )
    ( on b75 b479 )
    ( on b38 b75 )
    ( on b193 b38 )
    ( on b610 b193 )
    ( on b788 b610 )
    ( on b630 b788 )
    ( on b685 b630 )
    ( on b855 b685 )
    ( on b537 b855 )
    ( on b692 b537 )
    ( on b496 b692 )
    ( on b812 b496 )
    ( on b619 b812 )
    ( on b925 b619 )
    ( on b180 b925 )
    ( on b969 b180 )
    ( on b59 b969 )
    ( on b95 b59 )
    ( on b517 b95 )
    ( on b412 b517 )
    ( on b36 b412 )
    ( on b325 b36 )
    ( on b887 b325 )
    ( on b435 b887 )
    ( on b303 b435 )
    ( on b480 b303 )
    ( on b907 b480 )
    ( on b64 b907 )
    ( on b965 b64 )
    ( on b690 b965 )
    ( on b809 b690 )
    ( on b665 b809 )
    ( on b829 b665 )
    ( on b19 b829 )
    ( on b901 b19 )
    ( on b797 b901 )
    ( on b66 b797 )
    ( on b795 b66 )
    ( clear b795 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
