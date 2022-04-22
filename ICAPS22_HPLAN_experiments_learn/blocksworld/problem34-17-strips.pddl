( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b469 - block
    b113 - block
    b802 - block
    b183 - block
    b533 - block
    b580 - block
    b6 - block
    b23 - block
    b640 - block
    b560 - block
    b155 - block
    b784 - block
    b410 - block
    b442 - block
    b946 - block
    b571 - block
    b741 - block
    b35 - block
    b916 - block
    b892 - block
    b110 - block
    b930 - block
    b387 - block
    b117 - block
    b768 - block
    b401 - block
    b695 - block
    b307 - block
    b895 - block
    b58 - block
    b915 - block
    b867 - block
    b891 - block
    b471 - block
    b973 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b469 )
    ( on b113 b469 )
    ( on b802 b113 )
    ( on b183 b802 )
    ( on b533 b183 )
    ( on b580 b533 )
    ( on b6 b580 )
    ( on b23 b6 )
    ( on b640 b23 )
    ( on b560 b640 )
    ( on b155 b560 )
    ( on b784 b155 )
    ( on b410 b784 )
    ( on b442 b410 )
    ( on b946 b442 )
    ( on b571 b946 )
    ( on b741 b571 )
    ( on b35 b741 )
    ( on b916 b35 )
    ( on b892 b916 )
    ( on b110 b892 )
    ( on b930 b110 )
    ( on b387 b930 )
    ( on b117 b387 )
    ( on b768 b117 )
    ( on b401 b768 )
    ( on b695 b401 )
    ( on b307 b695 )
    ( on b895 b307 )
    ( on b58 b895 )
    ( on b915 b58 )
    ( on b867 b915 )
    ( on b891 b867 )
    ( on b471 b891 )
    ( on b973 b471 )
    ( clear b973 )
  )
  ( :goal
    ( and
      ( clear b469 )
    )
  )
)
