( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b759 - block
    b728 - block
    b32 - block
    b616 - block
    b373 - block
    b312 - block
    b925 - block
    b842 - block
    b448 - block
    b497 - block
    b450 - block
    b338 - block
    b684 - block
    b499 - block
    b277 - block
    b885 - block
    b62 - block
    b607 - block
    b863 - block
    b291 - block
    b779 - block
    b703 - block
    b752 - block
    b992 - block
    b398 - block
    b866 - block
    b890 - block
    b87 - block
    b697 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b759 )
    ( on b728 b759 )
    ( on b32 b728 )
    ( on b616 b32 )
    ( on b373 b616 )
    ( on b312 b373 )
    ( on b925 b312 )
    ( on b842 b925 )
    ( on b448 b842 )
    ( on b497 b448 )
    ( on b450 b497 )
    ( on b338 b450 )
    ( on b684 b338 )
    ( on b499 b684 )
    ( on b277 b499 )
    ( on b885 b277 )
    ( on b62 b885 )
    ( on b607 b62 )
    ( on b863 b607 )
    ( on b291 b863 )
    ( on b779 b291 )
    ( on b703 b779 )
    ( on b752 b703 )
    ( on b992 b752 )
    ( on b398 b992 )
    ( on b866 b398 )
    ( on b890 b866 )
    ( on b87 b890 )
    ( on b697 b87 )
    ( clear b697 )
  )
  ( :goal
    ( and
      ( clear b759 )
    )
  )
)
