( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b735 - block
    b884 - block
    b538 - block
    b444 - block
    b965 - block
    b879 - block
    b737 - block
    b970 - block
    b507 - block
    b491 - block
    b669 - block
    b637 - block
    b148 - block
    b766 - block
    b935 - block
    b985 - block
    b207 - block
    b80 - block
    b553 - block
    b814 - block
    b378 - block
    b296 - block
    b690 - block
    b60 - block
    b791 - block
    b81 - block
    b425 - block
    b16 - block
    b211 - block
    b64 - block
    b480 - block
    b189 - block
    b417 - block
    b269 - block
    b600 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b735 )
    ( on b884 b735 )
    ( on b538 b884 )
    ( on b444 b538 )
    ( on b965 b444 )
    ( on b879 b965 )
    ( on b737 b879 )
    ( on b970 b737 )
    ( on b507 b970 )
    ( on b491 b507 )
    ( on b669 b491 )
    ( on b637 b669 )
    ( on b148 b637 )
    ( on b766 b148 )
    ( on b935 b766 )
    ( on b985 b935 )
    ( on b207 b985 )
    ( on b80 b207 )
    ( on b553 b80 )
    ( on b814 b553 )
    ( on b378 b814 )
    ( on b296 b378 )
    ( on b690 b296 )
    ( on b60 b690 )
    ( on b791 b60 )
    ( on b81 b791 )
    ( on b425 b81 )
    ( on b16 b425 )
    ( on b211 b16 )
    ( on b64 b211 )
    ( on b480 b64 )
    ( on b189 b480 )
    ( on b417 b189 )
    ( on b269 b417 )
    ( on b600 b269 )
    ( clear b600 )
  )
  ( :goal
    ( and
      ( clear b735 )
    )
  )
)
