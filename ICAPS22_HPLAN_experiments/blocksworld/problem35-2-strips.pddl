( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b322 - block
    b783 - block
    b193 - block
    b626 - block
    b834 - block
    b655 - block
    b683 - block
    b705 - block
    b986 - block
    b277 - block
    b472 - block
    b86 - block
    b169 - block
    b161 - block
    b773 - block
    b868 - block
    b756 - block
    b319 - block
    b969 - block
    b316 - block
    b588 - block
    b915 - block
    b695 - block
    b801 - block
    b312 - block
    b93 - block
    b948 - block
    b307 - block
    b245 - block
    b506 - block
    b122 - block
    b179 - block
    b518 - block
    b135 - block
    b658 - block
    b198 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b322 )
    ( on b783 b322 )
    ( on b193 b783 )
    ( on b626 b193 )
    ( on b834 b626 )
    ( on b655 b834 )
    ( on b683 b655 )
    ( on b705 b683 )
    ( on b986 b705 )
    ( on b277 b986 )
    ( on b472 b277 )
    ( on b86 b472 )
    ( on b169 b86 )
    ( on b161 b169 )
    ( on b773 b161 )
    ( on b868 b773 )
    ( on b756 b868 )
    ( on b319 b756 )
    ( on b969 b319 )
    ( on b316 b969 )
    ( on b588 b316 )
    ( on b915 b588 )
    ( on b695 b915 )
    ( on b801 b695 )
    ( on b312 b801 )
    ( on b93 b312 )
    ( on b948 b93 )
    ( on b307 b948 )
    ( on b245 b307 )
    ( on b506 b245 )
    ( on b122 b506 )
    ( on b179 b122 )
    ( on b518 b179 )
    ( on b135 b518 )
    ( on b658 b135 )
    ( on b198 b658 )
    ( clear b198 )
  )
  ( :goal
    ( and
      ( clear b322 )
    )
  )
)
