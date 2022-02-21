( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b560 - block
    b889 - block
    b604 - block
    b826 - block
    b678 - block
    b696 - block
    b924 - block
    b505 - block
    b733 - block
    b81 - block
    b83 - block
    b656 - block
    b895 - block
    b923 - block
    b657 - block
    b422 - block
    b788 - block
    b356 - block
    b784 - block
    b877 - block
    b759 - block
    b287 - block
    b762 - block
    b866 - block
    b184 - block
    b402 - block
    b724 - block
    b329 - block
    b648 - block
    b109 - block
    b728 - block
    b698 - block
    b88 - block
    b523 - block
    b770 - block
    b896 - block
    b433 - block
    b933 - block
    b574 - block
    b146 - block
    b59 - block
    b230 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b560 )
    ( on b889 b560 )
    ( on b604 b889 )
    ( on b826 b604 )
    ( on b678 b826 )
    ( on b696 b678 )
    ( on b924 b696 )
    ( on b505 b924 )
    ( on b733 b505 )
    ( on b81 b733 )
    ( on b83 b81 )
    ( on b656 b83 )
    ( on b895 b656 )
    ( on b923 b895 )
    ( on b657 b923 )
    ( on b422 b657 )
    ( on b788 b422 )
    ( on b356 b788 )
    ( on b784 b356 )
    ( on b877 b784 )
    ( on b759 b877 )
    ( on b287 b759 )
    ( on b762 b287 )
    ( on b866 b762 )
    ( on b184 b866 )
    ( on b402 b184 )
    ( on b724 b402 )
    ( on b329 b724 )
    ( on b648 b329 )
    ( on b109 b648 )
    ( on b728 b109 )
    ( on b698 b728 )
    ( on b88 b698 )
    ( on b523 b88 )
    ( on b770 b523 )
    ( on b896 b770 )
    ( on b433 b896 )
    ( on b933 b433 )
    ( on b574 b933 )
    ( on b146 b574 )
    ( on b59 b146 )
    ( on b230 b59 )
    ( clear b230 )
  )
  ( :goal
    ( and
      ( clear b560 )
    )
  )
)
