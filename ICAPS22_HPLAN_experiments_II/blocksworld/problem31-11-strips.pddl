( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b593 - block
    b648 - block
    b380 - block
    b165 - block
    b132 - block
    b231 - block
    b565 - block
    b724 - block
    b383 - block
    b428 - block
    b229 - block
    b334 - block
    b427 - block
    b897 - block
    b415 - block
    b115 - block
    b28 - block
    b432 - block
    b541 - block
    b2 - block
    b635 - block
    b996 - block
    b538 - block
    b94 - block
    b625 - block
    b851 - block
    b443 - block
    b29 - block
    b641 - block
    b147 - block
    b144 - block
    b301 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b593 )
    ( on b648 b593 )
    ( on b380 b648 )
    ( on b165 b380 )
    ( on b132 b165 )
    ( on b231 b132 )
    ( on b565 b231 )
    ( on b724 b565 )
    ( on b383 b724 )
    ( on b428 b383 )
    ( on b229 b428 )
    ( on b334 b229 )
    ( on b427 b334 )
    ( on b897 b427 )
    ( on b415 b897 )
    ( on b115 b415 )
    ( on b28 b115 )
    ( on b432 b28 )
    ( on b541 b432 )
    ( on b2 b541 )
    ( on b635 b2 )
    ( on b996 b635 )
    ( on b538 b996 )
    ( on b94 b538 )
    ( on b625 b94 )
    ( on b851 b625 )
    ( on b443 b851 )
    ( on b29 b443 )
    ( on b641 b29 )
    ( on b147 b641 )
    ( on b144 b147 )
    ( on b301 b144 )
    ( clear b301 )
  )
  ( :goal
    ( and
      ( clear b593 )
    )
  )
)
