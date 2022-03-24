( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b728 - block
    b272 - block
    b992 - block
    b84 - block
    b995 - block
    b751 - block
    b761 - block
    b402 - block
    b570 - block
    b114 - block
    b602 - block
    b626 - block
    b193 - block
    b720 - block
    b383 - block
    b861 - block
    b122 - block
    b817 - block
    b133 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b728 )
    ( on b272 b728 )
    ( on b992 b272 )
    ( on b84 b992 )
    ( on b995 b84 )
    ( on b751 b995 )
    ( on b761 b751 )
    ( on b402 b761 )
    ( on b570 b402 )
    ( on b114 b570 )
    ( on b602 b114 )
    ( on b626 b602 )
    ( on b193 b626 )
    ( on b720 b193 )
    ( on b383 b720 )
    ( on b861 b383 )
    ( on b122 b861 )
    ( on b817 b122 )
    ( on b133 b817 )
    ( clear b133 )
  )
  ( :tasks
    ( Make-18Pile b272 b992 b84 b995 b751 b761 b402 b570 b114 b602 b626 b193 b720 b383 b861 b122 b817 b133 )
  )
)
