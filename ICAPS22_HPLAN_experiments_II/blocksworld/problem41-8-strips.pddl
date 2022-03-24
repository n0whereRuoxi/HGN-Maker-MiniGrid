( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b975 - block
    b861 - block
    b81 - block
    b791 - block
    b403 - block
    b900 - block
    b899 - block
    b509 - block
    b969 - block
    b864 - block
    b550 - block
    b974 - block
    b346 - block
    b574 - block
    b138 - block
    b269 - block
    b585 - block
    b12 - block
    b472 - block
    b883 - block
    b669 - block
    b388 - block
    b784 - block
    b69 - block
    b342 - block
    b305 - block
    b539 - block
    b86 - block
    b971 - block
    b732 - block
    b380 - block
    b659 - block
    b515 - block
    b162 - block
    b678 - block
    b842 - block
    b577 - block
    b445 - block
    b111 - block
    b606 - block
    b326 - block
    b33 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b975 )
    ( on b861 b975 )
    ( on b81 b861 )
    ( on b791 b81 )
    ( on b403 b791 )
    ( on b900 b403 )
    ( on b899 b900 )
    ( on b509 b899 )
    ( on b969 b509 )
    ( on b864 b969 )
    ( on b550 b864 )
    ( on b974 b550 )
    ( on b346 b974 )
    ( on b574 b346 )
    ( on b138 b574 )
    ( on b269 b138 )
    ( on b585 b269 )
    ( on b12 b585 )
    ( on b472 b12 )
    ( on b883 b472 )
    ( on b669 b883 )
    ( on b388 b669 )
    ( on b784 b388 )
    ( on b69 b784 )
    ( on b342 b69 )
    ( on b305 b342 )
    ( on b539 b305 )
    ( on b86 b539 )
    ( on b971 b86 )
    ( on b732 b971 )
    ( on b380 b732 )
    ( on b659 b380 )
    ( on b515 b659 )
    ( on b162 b515 )
    ( on b678 b162 )
    ( on b842 b678 )
    ( on b577 b842 )
    ( on b445 b577 )
    ( on b111 b445 )
    ( on b606 b111 )
    ( on b326 b606 )
    ( on b33 b326 )
    ( clear b33 )
  )
  ( :goal
    ( and
      ( clear b975 )
    )
  )
)
