<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\DB;
use App\User;
use App\Post;
use Illuminate\Http\Request;

class PostsController extends Controller
{
    public function __construct()
    {
        $this->middleware(['auth','verified']);
    }
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $posts = Post::all()->toArray();
        return array_reverse($posts);
    }

    /**
     * Display a listing of the posts joined
     * 
     * @return \Illuminate\Http\Response
     */
    public function readPostsJoined(Request $request) {

        $postsJoined = DB::table('post_user')
            ->join('posts', function ($join) {
                $join->on('post_user.post_id', '=', 'posts.id');
            })
            ->where([
                ['post_user.user_id' , $request->input('user_id')],
                ['join_status', 1]
            ])
            ->get();
        return response()->json($postsJoined);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create(Request $request)
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $data = request()->validate([
            'post_name'=> 'required',
            'category'=> 'required',
            'description' => 'required'
        ]);
        auth()->user()->posts()->create(array_merge(
            $data
        ));
        return response()->json("post created");
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $post = Post::find($id);
        return response()->json($post);
    }

    /**
     * Display the specified resource by user_id
     * 
     * @param int $user_id
     * @return \Illuminate\Http\Response
     */

    public function showByUserId($user_id) {
        $posts = DB::table('posts')->where('user_id', $user_id)->get();
        return response()->json($posts);     
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $post = Post::find($id);
        $data = request()->validate([
            'post_name'=> 'required',
            'category'=> 'required',
            'description' => 'required'
        ]);

        $post->update($data);
        return response()->json('The post successfully updated');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $post = Post::find($id);
        $post->delete();

        return response()->json("post successfully deleted");
    }
    public function showMyPosts($user_id)
    {
         $user = User::find($user_id);
         $posts = $user->posts();
         return response()->json(['posts'=>$posts]);
    }
}
