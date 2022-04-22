( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b459 - block
    b759 - block
    b916 - block
    b301 - block
    b850 - block
    b443 - block
    b322 - block
    b735 - block
    b641 - block
    b35 - block
    b661 - block
    b528 - block
    b2 - block
    b934 - block
    b957 - block
    b442 - block
    b377 - block
    b485 - block
    b565 - block
    b615 - block
    b629 - block
    b668 - block
    b685 - block
    b221 - block
    b993 - block
    b687 - block
    b508 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b459 )
    ( on b759 b459 )
    ( on b916 b759 )
    ( on b301 b916 )
    ( on b850 b301 )
    ( on b443 b850 )
    ( on b322 b443 )
    ( on b735 b322 )
    ( on b641 b735 )
    ( on b35 b641 )
    ( on b661 b35 )
    ( on b528 b661 )
    ( on b2 b528 )
    ( on b934 b2 )
    ( on b957 b934 )
    ( on b442 b957 )
    ( on b377 b442 )
    ( on b485 b377 )
    ( on b565 b485 )
    ( on b615 b565 )
    ( on b629 b615 )
    ( on b668 b629 )
    ( on b685 b668 )
    ( on b221 b685 )
    ( on b993 b221 )
    ( on b687 b993 )
    ( on b508 b687 )
    ( clear b508 )
  )
  ( :goal
    ( and
      ( clear b459 )
    )
  )
)
