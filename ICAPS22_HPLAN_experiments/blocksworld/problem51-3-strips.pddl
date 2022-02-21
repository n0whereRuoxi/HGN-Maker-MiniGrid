( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b255 - block
    b481 - block
    b331 - block
    b31 - block
    b580 - block
    b889 - block
    b10 - block
    b99 - block
    b52 - block
    b960 - block
    b963 - block
    b484 - block
    b22 - block
    b639 - block
    b736 - block
    b533 - block
    b450 - block
    b602 - block
    b236 - block
    b307 - block
    b192 - block
    b418 - block
    b797 - block
    b101 - block
    b591 - block
    b762 - block
    b776 - block
    b355 - block
    b795 - block
    b297 - block
    b364 - block
    b361 - block
    b749 - block
    b50 - block
    b395 - block
    b370 - block
    b670 - block
    b217 - block
    b398 - block
    b832 - block
    b663 - block
    b382 - block
    b770 - block
    b415 - block
    b712 - block
    b767 - block
    b156 - block
    b269 - block
    b936 - block
    b241 - block
    b383 - block
    b449 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b255 )
    ( on b481 b255 )
    ( on b331 b481 )
    ( on b31 b331 )
    ( on b580 b31 )
    ( on b889 b580 )
    ( on b10 b889 )
    ( on b99 b10 )
    ( on b52 b99 )
    ( on b960 b52 )
    ( on b963 b960 )
    ( on b484 b963 )
    ( on b22 b484 )
    ( on b639 b22 )
    ( on b736 b639 )
    ( on b533 b736 )
    ( on b450 b533 )
    ( on b602 b450 )
    ( on b236 b602 )
    ( on b307 b236 )
    ( on b192 b307 )
    ( on b418 b192 )
    ( on b797 b418 )
    ( on b101 b797 )
    ( on b591 b101 )
    ( on b762 b591 )
    ( on b776 b762 )
    ( on b355 b776 )
    ( on b795 b355 )
    ( on b297 b795 )
    ( on b364 b297 )
    ( on b361 b364 )
    ( on b749 b361 )
    ( on b50 b749 )
    ( on b395 b50 )
    ( on b370 b395 )
    ( on b670 b370 )
    ( on b217 b670 )
    ( on b398 b217 )
    ( on b832 b398 )
    ( on b663 b832 )
    ( on b382 b663 )
    ( on b770 b382 )
    ( on b415 b770 )
    ( on b712 b415 )
    ( on b767 b712 )
    ( on b156 b767 )
    ( on b269 b156 )
    ( on b936 b269 )
    ( on b241 b936 )
    ( on b383 b241 )
    ( on b449 b383 )
    ( clear b449 )
  )
  ( :goal
    ( and
      ( clear b255 )
    )
  )
)
