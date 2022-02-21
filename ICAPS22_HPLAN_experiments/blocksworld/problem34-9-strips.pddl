( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b871 - block
    b282 - block
    b586 - block
    b713 - block
    b491 - block
    b723 - block
    b40 - block
    b15 - block
    b262 - block
    b866 - block
    b785 - block
    b342 - block
    b602 - block
    b679 - block
    b670 - block
    b716 - block
    b505 - block
    b139 - block
    b361 - block
    b606 - block
    b32 - block
    b273 - block
    b507 - block
    b45 - block
    b227 - block
    b163 - block
    b587 - block
    b372 - block
    b718 - block
    b818 - block
    b380 - block
    b482 - block
    b215 - block
    b971 - block
    b546 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b871 )
    ( on b282 b871 )
    ( on b586 b282 )
    ( on b713 b586 )
    ( on b491 b713 )
    ( on b723 b491 )
    ( on b40 b723 )
    ( on b15 b40 )
    ( on b262 b15 )
    ( on b866 b262 )
    ( on b785 b866 )
    ( on b342 b785 )
    ( on b602 b342 )
    ( on b679 b602 )
    ( on b670 b679 )
    ( on b716 b670 )
    ( on b505 b716 )
    ( on b139 b505 )
    ( on b361 b139 )
    ( on b606 b361 )
    ( on b32 b606 )
    ( on b273 b32 )
    ( on b507 b273 )
    ( on b45 b507 )
    ( on b227 b45 )
    ( on b163 b227 )
    ( on b587 b163 )
    ( on b372 b587 )
    ( on b718 b372 )
    ( on b818 b718 )
    ( on b380 b818 )
    ( on b482 b380 )
    ( on b215 b482 )
    ( on b971 b215 )
    ( on b546 b971 )
    ( clear b546 )
  )
  ( :goal
    ( and
      ( clear b871 )
    )
  )
)
