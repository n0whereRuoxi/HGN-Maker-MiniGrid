( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b391 - block
    b607 - block
    b628 - block
    b530 - block
    b396 - block
    b167 - block
    b143 - block
    b681 - block
    b886 - block
    b853 - block
    b798 - block
    b12 - block
    b313 - block
    b674 - block
    b625 - block
    b89 - block
    b940 - block
    b408 - block
    b271 - block
    b298 - block
    b318 - block
    b274 - block
    b427 - block
    b171 - block
    b295 - block
    b961 - block
    b955 - block
    b410 - block
    b356 - block
    b702 - block
    b845 - block
    b994 - block
    b914 - block
    b710 - block
    b933 - block
    b603 - block
    b517 - block
    b781 - block
    b557 - block
    b550 - block
    b397 - block
    b727 - block
    b479 - block
    b775 - block
    b840 - block
    b609 - block
    b723 - block
    b314 - block
    b947 - block
    b495 - block
    b949 - block
    b794 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b391 )
    ( on b607 b391 )
    ( on b628 b607 )
    ( on b530 b628 )
    ( on b396 b530 )
    ( on b167 b396 )
    ( on b143 b167 )
    ( on b681 b143 )
    ( on b886 b681 )
    ( on b853 b886 )
    ( on b798 b853 )
    ( on b12 b798 )
    ( on b313 b12 )
    ( on b674 b313 )
    ( on b625 b674 )
    ( on b89 b625 )
    ( on b940 b89 )
    ( on b408 b940 )
    ( on b271 b408 )
    ( on b298 b271 )
    ( on b318 b298 )
    ( on b274 b318 )
    ( on b427 b274 )
    ( on b171 b427 )
    ( on b295 b171 )
    ( on b961 b295 )
    ( on b955 b961 )
    ( on b410 b955 )
    ( on b356 b410 )
    ( on b702 b356 )
    ( on b845 b702 )
    ( on b994 b845 )
    ( on b914 b994 )
    ( on b710 b914 )
    ( on b933 b710 )
    ( on b603 b933 )
    ( on b517 b603 )
    ( on b781 b517 )
    ( on b557 b781 )
    ( on b550 b557 )
    ( on b397 b550 )
    ( on b727 b397 )
    ( on b479 b727 )
    ( on b775 b479 )
    ( on b840 b775 )
    ( on b609 b840 )
    ( on b723 b609 )
    ( on b314 b723 )
    ( on b947 b314 )
    ( on b495 b947 )
    ( on b949 b495 )
    ( on b794 b949 )
    ( clear b794 )
  )
  ( :goal
    ( and
      ( clear b391 )
    )
  )
)
