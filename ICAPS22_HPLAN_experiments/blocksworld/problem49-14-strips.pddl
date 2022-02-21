( define ( problem probname )
  ( :domain blocks4 )
  ( :requirements :strips :typing :equality )
  ( :objects
    b80 - block
    b428 - block
    b858 - block
    b908 - block
    b181 - block
    b859 - block
    b829 - block
    b936 - block
    b778 - block
    b439 - block
    b315 - block
    b944 - block
    b368 - block
    b729 - block
    b831 - block
    b166 - block
    b667 - block
    b845 - block
    b390 - block
    b679 - block
    b52 - block
    b28 - block
    b638 - block
    b532 - block
    b925 - block
    b64 - block
    b278 - block
    b94 - block
    b275 - block
    b11 - block
    b291 - block
    b289 - block
    b366 - block
    b360 - block
    b451 - block
    b460 - block
    b826 - block
    b686 - block
    b520 - block
    b1 - block
    b216 - block
    b533 - block
    b928 - block
    b172 - block
    b932 - block
    b628 - block
    b93 - block
    b584 - block
    b894 - block
    b444 - block
  )
  ( :init
    ( hand-empty )
    ( on-table b80 )
    ( on b428 b80 )
    ( on b858 b428 )
    ( on b908 b858 )
    ( on b181 b908 )
    ( on b859 b181 )
    ( on b829 b859 )
    ( on b936 b829 )
    ( on b778 b936 )
    ( on b439 b778 )
    ( on b315 b439 )
    ( on b944 b315 )
    ( on b368 b944 )
    ( on b729 b368 )
    ( on b831 b729 )
    ( on b166 b831 )
    ( on b667 b166 )
    ( on b845 b667 )
    ( on b390 b845 )
    ( on b679 b390 )
    ( on b52 b679 )
    ( on b28 b52 )
    ( on b638 b28 )
    ( on b532 b638 )
    ( on b925 b532 )
    ( on b64 b925 )
    ( on b278 b64 )
    ( on b94 b278 )
    ( on b275 b94 )
    ( on b11 b275 )
    ( on b291 b11 )
    ( on b289 b291 )
    ( on b366 b289 )
    ( on b360 b366 )
    ( on b451 b360 )
    ( on b460 b451 )
    ( on b826 b460 )
    ( on b686 b826 )
    ( on b520 b686 )
    ( on b1 b520 )
    ( on b216 b1 )
    ( on b533 b216 )
    ( on b928 b533 )
    ( on b172 b928 )
    ( on b932 b172 )
    ( on b628 b932 )
    ( on b93 b628 )
    ( on b584 b93 )
    ( on b894 b584 )
    ( on b444 b894 )
    ( clear b444 )
  )
  ( :goal
    ( and
      ( clear b80 )
    )
  )
)
