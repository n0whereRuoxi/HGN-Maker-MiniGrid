( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b642 - block
    b912 - block
    b913 - block
    b231 - block
    b515 - block
    b454 - block
    b494 - block
    b718 - block
    b526 - block
    b535 - block
    b45 - block
    b256 - block
    b785 - block
    b523 - block
    b49 - block
    b935 - block
    b695 - block
    b757 - block
    b888 - block
    b345 - block
    b815 - block
    b675 - block
    b788 - block
    b415 - block
    b20 - block
    b694 - block
    b804 - block
    b821 - block
    b430 - block
    b775 - block
    b330 - block
    b369 - block
    b189 - block
    b240 - block
    b833 - block
    b669 - block
    b906 - block
    b261 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b642 )
    ( on b912 b642 )
    ( on b913 b912 )
    ( on b231 b913 )
    ( on b515 b231 )
    ( on b454 b515 )
    ( on b494 b454 )
    ( on b718 b494 )
    ( on b526 b718 )
    ( on b535 b526 )
    ( on b45 b535 )
    ( on b256 b45 )
    ( on b785 b256 )
    ( on b523 b785 )
    ( on b49 b523 )
    ( on b935 b49 )
    ( on b695 b935 )
    ( on b757 b695 )
    ( on b888 b757 )
    ( on b345 b888 )
    ( on b815 b345 )
    ( on b675 b815 )
    ( on b788 b675 )
    ( on b415 b788 )
    ( on b20 b415 )
    ( on b694 b20 )
    ( on b804 b694 )
    ( on b821 b804 )
    ( on b430 b821 )
    ( on b775 b430 )
    ( on b330 b775 )
    ( on b369 b330 )
    ( on b189 b369 )
    ( on b240 b189 )
    ( on b833 b240 )
    ( on b669 b833 )
    ( on b906 b669 )
    ( on b261 b906 )
    ( clear b261 )
  )
  ( :goal
    ( and
      ( clear b642 )
    )
  )
)
